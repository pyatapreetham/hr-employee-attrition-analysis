# HR Employee Attrition & Workforce Analytics

An end-to-end **Data Analytics project** focused on understanding employee attrition, workforce patterns, and factors associated with employee turnover.

The project uses **Amazon S3, AWS Glue, Amazon Athena, SQL, and Power BI** to build a complete analytics workflow from raw HR data to business insights and visualization.

---

## 📌 Project Objective

The objective of this project is to analyze employee attrition and identify patterns across:

* Departments
* Job roles
* Overtime
* Age groups
* Income
* Employee tenure
* Job satisfaction
* Work-life balance
* Business travel
* Other workforce attributes

The analysis helps answer questions such as:

* How many employees are currently in the organization?
* What is the overall attrition rate?
* Which departments have higher attrition?
* Which job roles experience more employee turnover?
* Does overtime relate to higher attrition?
* How does income vary across employees?
* Does employee tenure relate to attrition?
* Which satisfaction factors are associated with employee attrition?

---

## 🛠️ Tools & Technologies

| Tool               | Purpose                                   |
| ------------------ | ----------------------------------------- |
| **Amazon S3**      | Store raw and processed datasets          |
| **AWS Glue**       | Data cataloging and visual ETL            |
| **Apache Parquet** | Store cleaned analytical data             |
| **Amazon Athena**  | SQL-based data analysis                   |
| **SQL**            | KPI, workforce, and attrition analysis    |
| **Power BI**       | Interactive dashboard and visualization   |
| **GitHub**         | Project documentation and version control |

---

## 🔄 Project Workflow

```text
Raw HR Dataset
      ↓
Amazon S3
      ↓
AWS Glue Crawler
      ↓
AWS Glue Visual ETL
      ↓
Data Cleaning & Transformation
      ↓
Cleaned Parquet Dataset
      ↓
Amazon Athena
      ↓
SQL Analysis
      ↓
Power BI
      ↓
HR Attrition Dashboard
      ↓
Business Insights & Conclusions
```

---

## 📊 Dataset

The project uses the **IBM HR Employee Attrition dataset**.

The dataset contains employee-level information covering areas such as:

* Employee demographics
* Department
* Job role
* Business travel
* Overtime
* Monthly income
* Job satisfaction
* Environment satisfaction
* Work-life balance
* Years at company
* Years in current role
* Years since last promotion
* Years with current manager
* Attrition status

### Main analytical fields

```text
Age
Attrition
BusinessTravel
DailyRate
Department
DistanceFromHome
Education
EducationField
EnvironmentSatisfaction
Gender
JobInvolvement
JobLevel
JobRole
JobSatisfaction
MaritalStatus
MonthlyIncome
NumCompaniesWorked
OverTime
PercentSalaryHike
PerformanceRating
RelationshipSatisfaction
StockOptionLevel
TotalWorkingYears
TrainingTimesLastYear
WorkLifeBalance
YearsAtCompany
YearsInCurrentRole
YearsSinceLastPromotion
YearsWithCurrManager
```

---

# ☁️ AWS Data Pipeline

## 1. Amazon S3

The raw HR dataset was uploaded to an Amazon S3 bucket.

S3 was used as the primary cloud storage layer for the project.

```text
S3
│
├── raw_dataset/
│
└── cleaned_dataset/
```

---

## 2. AWS Glue

AWS Glue was used to prepare the dataset for analytical querying.

### Steps performed

* Created a Glue crawler
* Crawled the raw dataset
* Identified the dataset schema
* Used Glue Visual ETL for transformation
* Removed unnecessary columns
* Converted the processed dataset into Parquet format
* Stored the cleaned output in S3

The cleaned dataset was generated as a Parquet file for efficient analytical querying.

---

## 3. Amazon Athena

Amazon Athena was used to query the cleaned Parquet dataset directly from Amazon S3.

SQL analysis was organized into the following categories:

```text
01 - Overall KPIs
02 - Department Analysis
03 - Job Role Analysis
04 - Overtime Analysis
05 - Age Analysis
06 - Income Analysis
07 - Tenure Analysis
08 - Satisfaction Analysis
09 - Business Questions
10 - Root Cause Analysis
```

---

# 📈 Power BI Dashboard

The cleaned Parquet data and analytical results were used to create an interactive Power BI dashboard.

The dashboard focuses on:

### Page 1 — Workforce Overview

* Total Employees
* Attrition Count
* Attrition Rate
* Average Monthly Income
* Department-wise Workforce
* Overall Attrition Overview

### Page 2 — Department & Job Role Analysis

* Employees by Department
* Attrition by Department
* Attrition Rate by Department
* Job Role Analysis
* Average Income by Job Role
* Workforce Distribution

### Page 3 — Attrition Drivers

* Overtime Analysis
* Age Analysis
* Income Analysis
* Tenure Analysis
* Satisfaction Analysis
* Key Attrition Patterns

---

# 🔍 Key Business Questions

The analysis investigates questions such as:

### Workforce

* How large is the workforce?
* How is the workforce distributed across departments?
* Which job roles have the highest employee counts?

### Attrition

* What is the overall attrition rate?
* Which departments have higher attrition?
* Which job roles have higher attrition?
* How does overtime relate to attrition?

### Employee Characteristics

* How does age relate to attrition?
* How does monthly income vary across employees?
* Does employee tenure differ between employees who stayed and those who left?

### Satisfaction

* How do job satisfaction levels vary?
* How does work-life balance relate to attrition?
* How does environment satisfaction vary across employees?

---

# 📂 Project Structure

```text
HR-Employee-Attrition-and-Workforce-Analytics/
│
├── README.md
│
├── data/
│   └── README.md
│
├── sql/
│   ├── 01_overall_kpis.sql
│   ├── 02_department_analysis.sql
│   ├── 03_job_role_analysis.sql
│   ├── 04_overtime_analysis.sql
│   ├── 05_age_analysis.sql
│   ├── 06_income_analysis.sql
│   ├── 07_tenure_analysis.sql
│   ├── 08_satisfaction_analysis.sql
│   ├── 09_business_questions.sql
│   └── 10_root_cause_analysis.sql
│
├── powerbi/
│   └── HR_Employee_Attrition_Dashboard.pbix
│
├── documentation/
│   ├── Conclusion.pdf
│   └── HR-Employee-Attrition-and-Workforce-Analytics.pdf
│
└── screenshots/
    ├── page1.png
    ├── page2.png
    └── page3.png
```

---

# 📄 Documentation

Detailed project documentation is available in the `documentation/` folder.

### Documentation files

* **Conclusion.pdf** — Final business findings and conclusions
* **HR-Employee-Attrition-and-Workforce-Analytics.pdf** — Project documentation covering the overall analytical workflow

---

# 🎯 Skills Demonstrated

This project demonstrates practical experience in:

* Data Cleaning
* Data Transformation
* SQL Analysis
* KPI Development
* Exploratory Data Analysis
* Workforce Analytics
* Attrition Analysis
* Business Question Analysis
* Root Cause Analysis
* AWS S3
* AWS Glue
* Amazon Athena
* Parquet
* Power BI
* Data Visualization
* GitHub Documentation

---

# 🚀 Project Outcome

The project demonstrates an end-to-end cloud-based analytics workflow:

```text
Data Storage
     ↓
Data Transformation
     ↓
Cloud Data Processing
     ↓
SQL Analytics
     ↓
Business Analysis
     ↓
Dashboard
     ↓
Insights
```

It provides a practical example of how HR data can be transformed into structured workforce analytics and business insights using AWS and modern data analytics tools.
