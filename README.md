# QuickPay FinTech Operations Case Study

### Student Information
- **Student Name:** Varad Bhaskar Jalgaonkar
- **Student ID:** [bitsom_ftai_2601216]
- **Public GitHub Repository Link:** [https://github.com/varadjalgaonkar1-eng/QuickPay-FinTech-Operations-Case-Study](https://github.com/varadjalgaonkar1-eng/QuickPay-FinTech-Operations-Case-Study)

---

## Tools Used
* **Spreadsheets (Excel/Google Sheets):** Data cleaning, currency conversion, and high-value/risk flagging.
* **SQL:** Business analysis, captured GMV calculations, and chargeback monitoring.
* **Python (Pandas):** Financial reconciliation between Ledger and Gateway data, and JSON normalization.
* **Looker Studio:** KPI monitoring (GMV, Success Rate, Amount at Risk) and trend visualization.

---

## Short Run Instructions

### 1. Data Setup
Ensure all raw files (`transactions_raw.csv`, `ledger.csv`, `gateway.csv`, etc.) are placed in the `01_data/raw/` folder.

### 2. Python Pipeline
* Navigate to the `04_python/` directory.
* Open and run `fintech_pipeline.ipynb`.
* The script will process the raw data and output 12 CSV files into `01_data/processed/` and generate `summary_metrics.json`.

### 3. SQL Analysis
* The SQL queries located in `03_sql/analysis_queries.sql` can be executed against the provided schema to generate business insights.

### 4. Dashboard
* The live business monitoring dashboard is accessible via the link in `05_visualization/dashboard_link.txt`.

---

## Project Structure
- `01_data/`: Contains raw and processed datasets.
- `02_spreadsheet/`: Spreadsheet workbook and logic summary.
- `03_sql/`: SQL queries and query result summaries.
- `04_python/`: Jupyter Notebook and reconciliation metrics.
- `05_visualization/`: Dashboard access link.
