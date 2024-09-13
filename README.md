# About nyiso-analysis repo
<p>The New York Independent System Operator (NYISO) is a not-for-profit organization that manages New York's electricity grid and wholesale electricity markets. This project contains Python code utilizing Pandas and PySpark for scraping the nyiso website for day ahead data from csv files, transforming it, and saving to a Databricks Delta Table. From here, we can use SQL queries on the Databricks table to aggregate and answer any questions we may have about the data.<br>More descriptive versions of the files are below:</p><br>
<ul>
  <li>nyiso_etl.ipynb contains the ETL code for pulling the data from nyiso's daily csv files. Some basic transformations such as data type transformations, and column renamings are done in Pandas, then converted to a PySpark dataframe to save as a Delta table in Databricks.</li>
  <li>nyiso_sql.sql contains the Databricks Spark SQL queries on the nyiso data.</li>
  <li>index.html is the webpage code for nyiso_sql, which will let you view the visualizations of the SQL queries.</li>
  <li>nyiso_lbmp.csv is the compiled data dating back to 2017 scraped from the nyiso website.</li>
</ul>
