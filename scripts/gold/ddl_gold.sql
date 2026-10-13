
/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/


-- ALl the object in gold layer is virtual one


-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
-- Creating customer dimension

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS 
SELECT
	ROW_NUMBER() OVER(ORDER BY cst_id) as customer_key,
	ci.cst_id						               as customer_id,
	ci.cst_key                         as customer_number,
	ci.cst_firstname				           as first_name,
	ci.cst_lastname                    as last_name,
	la.cntry                           as country,
	ci.cst_marital_status              as marital_status,
	CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr -- CRM is the master of gender info
		 ELSE COALESCE(ca.gen, 'n/a')
	END AS gender,
	ca.bdate as birthdate,
	ci.cst_create_date as create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_loc_az12 ca
ON		  ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON        ci.cst_key = la.cid;

GO


-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

 -- Create product dimension
 -- if end date is NULL then it is current info of the product

IF OBJECT_ID('gold.dim_product', 'V') IS NOT NULL
	DROP VIEW gold.dim_product;
GO

CREATE VIEW gold.dim_product AS 
SELECT
	ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt, pn.prd_key) AS product_key,
	pn.prd_id							  as product_id,
	pn.prd_key							as product_number,
	pn.prd_nm							  as product_name,
	pn.cat_id							  as category_id,
	pc.cat								  as category,
	pc.subcat							  as subcategory,
	pc.maintenance					as maintenance,
	pn.prd_cost							as product_cost,
	pn.prd_line							as product_line,
	pn.prd_start_dt					as product_start_date
FROM silver.crm_prod_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pn.cat_id = pc.cid
WHERE prd_end_dt IS NULL -- filter out all historical data
;
GO


-- Create Fact Sales
-- Buidling fact use the dimension's surrogate key instead of IDs to easily connect facts and dimensions
-- replace prd_key sls_prd_key and sls_cust_id is replace by the surrogate key that we have generated and in order to that 
-- we have to go and join now  the two dimensions in order to get the surrogate key. we call this process data lookup
-- so we are joining the table in order to get one information.
-- sort the columns in logical groups to improve readability

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================


IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
	DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales AS
SELECT
	sd.sls_ord_num					as order_number,
	pr.product_key,
	cr.customer_key,
	sd.sls_order_dt					as order_date,
	sd.sls_ship_dt					as shipping_date,
	sd.sls_due_dt					  as due_date,
	sd.sls_sales					  as sales_amount,
	sd.sls_quantity					as quantity,
	sd.sls_price					  as price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_product pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cr
ON sd.sls_cust_id = cr.customer_id;

GO
