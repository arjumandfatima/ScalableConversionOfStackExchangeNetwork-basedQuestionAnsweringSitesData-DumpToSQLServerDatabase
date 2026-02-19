# Scalable Conversion of Stack Exchange Network-based Question Answering Sites’ Data Dump to SQL Server Database – A Case of Stack Overflow Data Dump
A replication package accompanying paper  entitled "Scalable Conversion of Stack Exchange Network-based Question Answering Sites’ Data Dump to SQL Server Database – A Case of Stack Overflow Data Dump"
## DOI 
https://doi.org/10.6084/m9.figshare.31361758<br>
This repository contains the replication package of the paper submitted to the Array Journal entitled _Scalable Conversion of Stack Exchange Network-based Ques-tion Answering Sites’ Data Dump to SQL Server Database – A Case of Stack Overflow Data Dump_

This method has been designed, developed, and reported by the following investigators:
1. Ms. Arjumand Fatima (Department of Computer Science, Quaid-i-Azam University)
2. Dr. Onaiza Maqbool (Department of Computer Science, Quaid-i-Azam University)
   
For any information, interested researchers can contact us by sending an email to any of the investigators listed above. The detailed step-by-step procedure is given below.

## How to cite the package
Fatima, Arjumand; Maqbool, Onaiza (2026). Replication Package for Scalable Conversion of Stack Exchange Network-based Question Answering Sites’ Data Dump to SQL Server Database – A Case of Stack Overflow Data Dump. figshare. Dataset. https://doi.org/10.6084/m9.figshare.31361758.v1 <br>
## Pre-requisites
### 1. Downloading the data dump
You first need to download the quarterly updated data dump of any of the Stack Exchange sites as explained [here](https://stackoverflow.com/help/data-dumps). We have utilized the latest data dump published in January 2026 for   _Stack Overflow_ which is the oldest among 182 Stack Exchange sites with the largest data dump to show the effectiveness of the proposed method.
### 2. Programming Languages, Tools, Operating System and Database Management System Used
Before following the step-by-step procedure, you need to install the set of required tools which are listed below.
1. Windows based Operating System (we have tested the procedure on Windows 10 Pro and Windows 11 Pro).
2. Python (we used Python version 3.13.9 which was installed through [Anaconda Distribution](https://www.anaconda.com/download); instead of downloading Python from its official site we preferred Anaconda Distribution as it contains Jupyter Notebooks and Pandas installed and has several other data science related libararies/pacakges installed).
3. Jupyter Notebook (to run the Python scripts provided in the paper; you may use command prompt or some other IDE if you have some experience of Python programming. You don't need to install it as it is part of Anaconda Distribution).
4. MS SQL Server Developer Edition (the database management system to store data; the Express Edition is not suitable due to 10GB database size limitation). [Download SQL Server 2025 Developer Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
5. SQL Server Management Studio (SSMS) (a graphical user interface (GUI) based tool to play with data so that you don't have to use command prompt). [Download SSMS](https://learn.microsoft.com/en-us/ssms/install/install).
6. Git Bash (you need to install Git on Windows; Git Bash is an application for Microsoft Windows environments which provides an emulation layer for a Git command line experience). [Download Git for Windows /x64 Setup](https://git-scm.com/install/windows).
7. 7zip (if your Windows version does not provide native support to unzip 7zip files. Windows 11 (23H2 and later) versions have native support for 7zip files).   
### 3. Downloading and Installing the Required Tools
In this section we explain the downloading and installation steps for each of the required items listed above before moving to the actual procedural details. You can skip this section if you have already installed the requried tools. We assume that the readers have a Windows based machine (connected to the Internet) for following these instructions.
#### 3.1 Anaconda Distribution of Python
1. Go to the [official Anaconda site](https://www.anaconda.com/download) where you will be required to sign up for downloading the distribution. After successful sign-up process, the system will offer you miniconda or anaconda distribution for download. Select anaconda distribution. Once downloaded, execute the installer by selecting Run as administrator from the context menu as shown below.
![Run as administrator](images/anaconda/1.png)<br>
2. Click next to continue.<br>
![Click next](images/anaconda/2.PNG)<br>
3. Agree to the license agreement.<br>
![License agreement](images/anaconda/3.PNG)<br>
4. Select installation type.<br>
![Installation type](images/anaconda/4.PNG)<br>
5. Choose the install location (keep the default).<br>
![Install location](images/anaconda/5.PNG)<br>
6. Check the advanced installation options as shown below.<br>
![Advanced installation options](images/anaconda/6.PNG)<br>
7. The installation will begin.<br>
![Installing](images/anaconda/7.PNG)<br>
8. It will take a few minutes to complete the installation.<br>
![Installation completed](images/anaconda/8.PNG)<br>
9. Click next.<br>
![Next](images/anaconda/9.PNG)<br>
10. Press finish.<br>
![Finish](images/anaconda/10.PNG)<br>
By now you have successfully installed Python and Jupyter Notebooks. 
#### 3.2 Git Bash
1. Go to the [official website of git](https://git-scm.com/) and press the Install for Windows button as shown below. The download will begin.<br>
![Official site](images/git-bash/1.PNG)<br>
2. Once downloaded, run the installer. The setup wizard will appear as shown below. Click Next.<br>
![Click next](images/git-bash/2.PNG)<br>
3. Select destination location (keep the default value).<br>
![Destination location](images/git-bash/3.PNG)<br>
4. Select components to be installed. Ensure Open Git Bash here is selected. Keep the rest as default.<br>
![Select git bash](images/git-bash/4.PNG)<br>
5. Choose the default editor for git. Several options are available in the drop down. Select the one you prefer. In our case, we didn't use any editor for git so the choice doesn't matter.<br>
![Preferred Editor](images/git-bash/5.PNG)<br>
6. Keep the default settings for the rest of the options presented to you before the installation begins.<br>
![Next](images/git-bash/5a.PNG)<br>
![Next](images/git-bash/6.PNG)<br>
![Next](images/git-bash/7.PNG)<br>
![Next](images/git-bash/8.PNG)<br>
![Next](images/git-bash/9.PNG)<br>
![Next](images/git-bash/10.PNG)<br>
![Next](images/git-bash/11.PNG)<br>
![Next](images/git-bash/12.PNG)<br>
![Next](images/git-bash/13.PNG)<br>
7. Press the install button.<br>
![Install](images/git-bash/14.PNG)<br>
8. The installation will begin.<br>
![Installing](images/git-bash/15.PNG)<br>
9. Select launch git bash.<br>
![Launch](images/git-bash/16.PNG)<br>
10. A small command prompt like window will appear as shown below. This is the git bash window.<br>
![Project Screenshot](images/git-bash/17.PNG)<br>
#### 3.3 MS SQL Server and SQL Server Management Studio (SSMS)0
1. Go to the [official site of SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) and select Download Standard Developer Edition as shown below.<br>
![Project Screenshot](images/sql-server/1.PNG)<br>
3. Once downloaded, run the installer. It will ask you to select an installation type. We used the custom option so that we can enable the full-text search feature of MS SQL Server. This later helped us in searching the textual content present in Posts and Comments efficiently.<br>
![Project Screenshot](images/sql-server/2a.PNG)<br>
4. Select the download target location (keep the default) and press Install.<br>
![Project Screenshot](images/sql-server/3a.PNG)<br>
5. It will lead you to the SQL Server Installation Center. From the left menu select Installation.<br>
![Project Screenshot](images/sql-server/4a.PNG)<br>
6. This will launch the SQL Server 2025 Setup. Select Standard Developer edition (as shown) and press Next.<br>
![Project Screenshot](images/sql-server/6a.PNG)<br>
7. Agree to the license agreement and click the Next button.<br>
![Project Screenshot](images/sql-server/7a.PNG)<br>
8. Check Use Microsoft Update to check for updates (recommended) and click Next.<br>
![Project Screenshot](images/sql-server/8a.PNG)<br>
9. The rule checking process will begin.<br>
![Project Screenshot](images/sql-server/9a.PNG)<br>
10. Click Next when the rules are successfully passed.<br>
![Project Screenshot](images/sql-server/10a.PNG)<br>
11. We are not interested in Azure Extension for SQL Server for this case, so simply ignore the options and click Next.
![Project Screenshot](images/sql-server/11a.PNG)<br>
12. In the Feature Selection window, check Full-Text and Semantic Extractions for Search and press Next. (We selected the custom installation option to enable this feature).<br>
![Project Screenshot](images/sql-server/12a.PNG)<br>
13. In the Instance Configuration window, keep the default instance selected and click Next.<br>
![Project Screenshot](images/sql-server/13a.PNG)<br>
14. Keep the Server Configuration as it is and click Next.<br>
![Project Screenshot](images/sql-server/14a.PNG)<br>
15. In case of Database Engine Configuration, select Windows Authentication Mode and then click Add Current User. After adding the Current User, click Next.<br>
![Project Screenshot](images/sql-server/15a.PNG)<br>
![Project Screenshot](images/sql-server/16a.PNG)<br>
16. By now you have configured everything needed and the setup is ready for installation. Click Install.<br>
![Project Screenshot](images/sql-server/17a.PNG)<br>
![Project Screenshot](images/sql-server/18a.PNG)<br>
17. Once the installation is complete, click close. This will take you back to SQL Server Installation Center. <br>
![Project Screenshot](images/sql-server/19a.PNG)<br>
18. Now select Install SQL Server Management Tools
![Project Screenshot](images/sql-server/20a.PNG)<br>
19. This will lead you to the official Microsfot page for Install SQL Management Studio. Press Download SQL Server Management Studio 22 Installer to download the installer.<br>
![Project Screenshot](images/ssms/8.PNG)<br>
20. Once the installer has been downloaded, run it. Visual Studio Installer will be launched. Click Continue.<br>
![Project Screenshot](images/ssms/1.PNG)<br>
![Project Screenshot](images/ssms/2.PNG)<br>
21. Once the Visual Studio Installer is ready, it will start downloading and installing the SQL Server Management Studio.<br>
![Project Screenshot](images/ssms/3.PNG)<br>
22. Restart your computer once the installation is done.<br>
![Project Screenshot](images/ssms/4.PNG)<br>

#### 7zip
1. To decompress the Stack Exchange data dump of any of the sites, you will need to have 7zip installed or supported on your system. If you have Windows 11 (23H2 or later) you don't need to install 7zip. If you have previous versions, follow these steps for installing 7zip from its official site.<br>
2. Press the download link for Windows.
![Project Screenshot](images/7zip/1.PNG)<br>
3. Once downloaded, run the installer and keep the default destination folder. Press Install.<br>
![Project Screenshot](images/7zip/2.PNG)<br>
4. Once the installation is complete, press close.
![Project Screenshot](images/7zip/3.PNG)<br>

### 4. Extracting the Downloaded Data Dump 
1. From this step onwards, we are dealing with Stack Overflow data dump published in January 2026 as a case study. You can follow the same procedure to download the Stack Exchange based data dump of any of the 182 Stack Exchange sites.<br>
![Project Screenshot](images/data-dump/download/jan.PNG)<br>
2. Ensure that the data dump has successfully downloaded by comparing the size of the downloaded file with that mentioned on the respective size. Once the data dump has successfully downloaded, we need to decompress it. <br>
![Project Screenshot](images/data-dump/download/1.PNG)<br>
3. Right click the folder, select 7zip --> Extract files.<br>
![Project Screenshot](images/data-dump/download/2.PNG)<br>
4. Select Extract to location and press ok. <br>
![Project Screenshot](images/data-dump/download/3.PNG)<br>
5. The extraction process will take some time depending on the file size.<br>
![Project Screenshot](images/data-dump/download/4.PNG)<br>
6. In case of Stack Overflow January 2026 data dump the extracted folder comprised of 333GB. <br>
![Project Screenshot](images/data-dump/download/5.PNG)<br>
7. The data dump will contain 8 XML files along with a license statement and a metadata file.<br>
![Project Screenshot](images/data-dump/download/6.PNG)<br>

### 5. Creating the Required Directory Structure
1. We have provided a create_split_folders.py file in the replication package. Download it and place it in the extracted folder containing the data dump. From now onwards, we will call it the root folder.<br>
![Project Screenshot](images/data-dump/create-split-xml/1.PNG)<br>
2. Open your Anaconda Prompt here. The image below shows simple command prompt but you need to do the same thing on Anaconda Prompt. Change the default path to the root directory and run the create_split_folders.py as shown below. It will ask you to select the files that you want to split. Based on your selection, the corresponding folders will be created. We have skipped Tags and PostLinks because we do not want to split them.<br>
![Project Screenshot](images/data-dump/create-split-xml/2.PNG)<br>

### 5. Splitting Large Sized XML File to Smaller Chunks Using Git Bash
1. Open Git Bash.<br>
![Project Screenshot](images/data-dump/split/1.png)<br>
2. Change the path to your root directory.<br>
![Project Screenshot](images/data-dump/split/2.PNG)<br>
![Project Screenshot](images/data-dump/split/3.PNG)<br>
3. Type the split commands mentioned in Step 2 of the accompanying Jupyter Notebook (StackOverflow_DataDump_Parsers.ipynb) present in the replication package.<br> We started with Badges. The corresponding command will create chunks of Badges.xml starting from Badges00000 inside Badges/Split folder.<br>
![Project Screenshot](images/data-dump/split/4.PNG)<br>
4. Once the split process is completed, the time taken to split will be displayed. We have reported the real time in paper.<br>
![Project Screenshot](images/data-dump/split/5.PNG)<br>
5. Repeat the same step for Users.<br>
![Project Screenshot](images/data-dump/split/6.PNG)<br>
6. Do the same for Comments.<br>
![Project Screenshot](images/data-dump/split/7.PNG)<br>
7. Votes<br>
![Project Screenshot](images/data-dump/split/8.PNG)<br>
9. Posts<br>
![Project Screenshot](images/data-dump/split/9.PNG)<br>
10. PostHistory<br>
![Project Screenshot](images/data-dump/split/10.PNG)<br>

### 6. Converting Smaller Chunks to Proper XML Files
1. Download the accompanying Jupyter Notebook (StackOverflow_DataDump_Parsers.ipynb) present in the replication package on your PC. Note the download location and launch the jupyter notebook from Anaconda prompt as shown below.<br>
![Project Screenshot](images/data-dump/chunk-to-xml/1.PNG)<br>
2. Jupyter notebook will be launched in the browser.<br>
![Project Screenshot](images/data-dump/chunk-to-xml/2.PNG)<br>
3. Now you need to run the code snippet provided in Step 3 (converting splitted files to proper XML files). This step needs to be repeated for Badges, Comments, PostHistory, Posts, Users and Votes one by one. Before running you need to change the input_path and output_path each time accordingly. Furthermore, you need to change opening and closing tags (<posts> and </posts>) each time according to the type of file e.g. <badges></badges> and so on. We started with PostHistory.<br>
![Project Screenshot](images/data-dump/chunk-to-xml/3.PNG)<br>
4. Posts<br>
![Project Screenshot](images/data-dump/chunk-to-xml/4.PNG)<br>
5. Votes<br>
![Project Screenshot](images/data-dump/chunk-to-xml/5.PNG)<br>
6. Users<br>
![Project Screenshot](images/data-dump/chunk-to-xml/6.PNG)<br>
7. Comments<br>
![Project Screenshot](images/data-dump/chunk-to-xml/7.PNG)<br>
8. Badges <br>
![Project Screenshot](images/data-dump/chunk-to-xml/8.PNG)<br>


### 7. Creating Databases and Tables in MS SQL Server Using SSMS
1. Open SSMS and press the connect button on the connection window that pops up. Carefully chose the connection properties as shown below.<br>
![Project Screenshot](images/data-dump/database-creation/1.PNG)<br>
2. In the object explorer on the left side, select databases and right click. Select New Database.<br>
![Project Screenshot](images/data-dump/database-creation/2.PNG)<br>
3. New Database wizard will appear. You can follow the database naming conventions from the accompanying jupter notebook. Enter database name.<br>
![Project Screenshot](images/data-dump/database-creation/3.PNG)<br>
4. If your C: drive has limited space, change the path for database files to some other drive having ample amount of space as shown below. Click Ok.<br>
![Project Screenshot](images/data-dump/database-creation/4.PNG)<br>
5. Once the database is created, it will be shown in the object explorer under Databases.<br>
![Project Screenshot](images/data-dump/database-creation/5.PNG)<br>
6. Repeat the same process for creating databases for Comments, Posts, PostHistory, PostLinks, Tags, Users, Votes.<br>
7. Once the required databases are created, we need to run the SQL scripts for creating tables. These scripts are present in the paper, in the accompanying notebook and in the repostory as create_database_tables.sql. You can get them from any of these three locations and run the scripts as shown below in SSMS. Creating StackOverflowBadges.<br>
![Project Screenshot](images/data-dump/database-creation/7.PNG)<br>
9. Creating StackOverflowComments. <br>
![Project Screenshot](images/data-dump/database-creation/8.PNG)<br>
10. Creating StackOverflowPostHistory. <br>
![Project Screenshot](images/data-dump/database-creation/9.PNG)<br>
11. Creating StackOverflowPostLinks.<br>
![Project Screenshot](images/data-dump/database-creation/10.PNG)<br>
12. Creating StackOverflowPosts.<br>
![Project Screenshot](images/data-dump/database-creation/11.PNG)<br>
13. Creating StackOverflowTags.<br>
![Project Screenshot](images/data-dump/database-creation/12.PNG)<br>
14. Creating StackOverflowUsers.<br>
![Project Screenshot](images/data-dump/database-creation/13.PNG)<br>
15. Creating StackOverflowVotes.<br>
![Project Screenshot](images/data-dump/database-creation/14.PNG)<br>

### 8. Reading small XML files and saving data to database
1. We now need to run the Badges Parser for Stack Overflow dataset section of the accompanying note. This will iteratively read the multiple XML files generated from the single large Badges.xml file present in the data dump. In each iteration, the file name under process will be printed along with time taken so far. Use the same approach to process the other files as well by running the respective parsers. <br>
![Project Screenshot](images/data-dump/execute-many/badges.PNG)<br>
2. Comments Parser for Stack Overflow dataset. <br>
![Project Screenshot](images/data-dump/execute-many/comments.PNG)<br>
3. PostHistory Parser for Stack Overflow dataset. <br>
![Project Screenshot](images/data-dump/execute-many/posthistory.PNG)<br>
4. PostLinks Parser for Stack Overflow dataset.<br>
![Project Screenshot](images/data-dump/execute-many/postlinks.PNG)<br>
5. Posts Parser for Stack Overflow dataset. <br>
![Project Screenshot](images/data-dump/execute-many/posts.PNG)<br>
6. Tags Parser for Stack Overflow dataset. <br>
![Project Screenshot](images/data-dump/execute-many/tags.PNG)<br>
7. Users Parser for Stack Overflow dataset.<br>
![Project Screenshot](images/data-dump/execute-many/users.PNG)<br>
8. Votes Parser for Stack Overflow dataset.<br>
![Project Screenshot](images/data-dump/execute-many/votes.PNG)<br>
The time shown in the screenshots may not be accurate, particularly in case of PostHistory and Posts which were not executed in one go. 





