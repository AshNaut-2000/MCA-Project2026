# MCA-Project2026
An Integrated Training and Placement Management System built using Java, JSP, Servlets, and MySQL

## Project Overview
**Skill Bridge** is an enterprise intranet-based application designed to streamline, automate, and centralize the recruitment, training, and placement workflows within educational institutions and corporate recruitment cells. 

The platform connects three core stakeholders—**Administrators, Corporate Recruiters (Companies), and Students/Candidates**—into a single unified ecosystem. By replacing paper-based resume submission and manual tracking, **Skill Bridge** enhances operational efficiency, enables criteria-based candidate filtering, and ensures secure profile verification.

-----

## Key Features & Functionality
### 1. Administrator Module
* **Centralized Dashboard:** Monitor system metrics, registered candidates, and corporate posting requests.
* **Smart Candidate Filtering:** Query candidates dynamically based on specific eligibility criteria (e.g., aggregate percentage, qualification degree, placement status like *Placed* vs. *Unplaced*).
* **Document & Video Verification:** Review and download candidate bio-data (Word format) and video resume clips for screening.
* **Access Rights & Auto ID:** Manage security credentials, global system ID generations, and database auditing.

### 2. Corporate / Company Module
* **Job Posting Management:** Publish hiring requirements, eligibility criteria, and job profiles.
* **Applicant Screening:** Review student profiles who applied for specific company drives.
* **Status Updates:** Update candidate interview rounds and selection outcomes.

### 3. Candidate / Student Module
* **Profile & Biodata Portal:** Upload personal, academic (10th, 12th, Graduation), and training details.
* **Multi-Format Resume Upload:** Support for standard document resume formats alongside video resume uploads.
* **Status Tracking:** Check placement drive participation status and application outcomes in real-time.
* **Inquiries & Communication:** Submit queries to administrators/helpdesk via built-in enquiry forms.

---

## Tech Stack & System Architecture

| Component | Technology / Tool Used |
| :--- | :--- |
| **Language & Backend** | Java (JDK 1.5+), Servlets, JDBC, Java Beans |
| **Web Front-End** | JSP (JavaServer Pages), HTML, CSS, JavaScript |
| **Database** | MySQL (SQLyog / MySQL Workbench Engine) |
| **Development Environment** | NetBeans IDE 6.9+ |
| **Web / Application Server** | Apache Tomcat Server |
| **Version Control** | Git & GitHub |

---

## System Architecture & Design Diagrams
The project design adheres to the Software Engineering **Waterfall Life Cycle Model** and includes detailed functional and structural models:
* **Data Flow Diagrams (DFDs):** Context Level (0-Level) & Detailed Level DFDs.
* **Entity-Relationship (E-R) Diagram:** Complete database relational mapping with key constraints.
* **State & Sequence Diagrams:** Control flow diagrams illustrating authentication and job application sequences.

---

## Installation & Local Environment Setup

### Prerequisites
* **Java Development Kit (JDK 1.5 / JDK 8+)** installed.
* **Apache Tomcat Server (v7.0 or higher)** configured.
* **MySQL Database Server** running on `localhost:3306`.
* **NetBeans IDE** installed.

### Steps
1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/AshNaut-200/MCA-Project2026.git](https://github.com/AshNaut-2000/MCA-Project2026.git)
   cd Skill-Bridge-Management-System
   ```
2. **Database Setup:**
   * Open your MySQL client (e.g., SQLyog, MySQL Workbench, or Command Line).
   * Create database named `catp`:
     ```sql
     CREATE DATABASE IF NOT EXISTS catp;
     USE catp;
     ```
   * Import the database tables and schema script provided in the repository's `database/catp.sql` directory.
3. **Configure Database Connection:**
   * Open `src/connection/connect.java` in your project workspace.
   * Update the connection strings with your local MySQL credentials:
     ```java
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/catp", "root", "your_password");
     ```
4. **Deploy & Run:**
   * Open the project in **NetBeans IDE**.
   * Add the MySQL JDBC Driver `.jar` to project libraries.
   * Clean, Build, and Deploy onto Apache Tomcat Server.
   * Open browser and navigate to: `http://localhost:8080/SkillBridge/index.jsp`

---

## Project Documentation Index
For academic evaluation and comprehensive analysis, refer to the complete capstone document outline included in the repository:
1. **System Requirement Specification (SRS) & Feasibility Analysis**
2. **Data Dictionary & Relational Tables**
3. **Software Testing Strategies & Test Cases**
4. **Security & Code Optimization Practices**

---

## License & Academic Usage
This project was developed as part of academic coursework for the Master of Computer Applications (MCA) capstone evaluation. It is distributed for educational and non-commercial reference purposes.
```

---
