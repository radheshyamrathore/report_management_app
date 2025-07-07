# MarketReportApp

MarketReportApp is an internal system built using Ruby on Rails 5.2.8 to manage market research reports within an organization. It features a user authentication system using Devise, supporting both admin and regular users. Admin users have access to all reports, while regular users can only manage their own. Each report includes attributes such as title, rich-text description (via TinyMCE), category, status (draft, published, or archived), and a publication date. Users can also upload a logo for each report using ActiveStorage.
The app includes filtering and pagination functionality, allowing reports to be filtered by category and status, with paginated results handled through Kaminari. When a report is marked as "published," a background job is triggered via Sidekiq to log the publication details to a file or Rails logger. The frontend is styled using Bootstrap 5, with jQuery enhancements like a character counter for the description field.

## Features

- **User Authentication:** Secure login using Devise for admin and regular users.
- **Report Management:** Create, view, edit, and delete reports with title, description, category, status, and logo upload.
- **Role-Based Access:** Regular users manage their own reports; admins manage all reports.
- **File Upload:** Upload logos with ActiveStorage.
- **Filtering & Pagination:** Filter reports by category/status and paginate using Kaminari.
- **Rich Text Editing:** Use TinyMCE for HTML-enabled descriptions.
- **Background Jobs:** Sidekiq logs published reports in background.
- **AJAX Enhancements:** Character counter and optional AJAX form submission with jQuery.
- **Responsive UI:** Clean design with Bootstrap 5.

## Technologies Used

- **Ruby on Rails 8.0.1:** Backend framework
- **Devise:** For authentication
- **Sidekiq:** For background jobs
- **ActiveStorage:** For uploading report logos
- **Kaminari Gem:** For paginating report lists
- **TinyMCE:** For HTML editing
- **Bootstrap 5:** For responsive layout
- **jQuery:** For frontend interactions

## Installation

### Prerequisites

- Ruby (version 3.2.6)
- Rails (version 8.0.2)
- PostgreSQL
- Node.js and Yarn

### Steps to Set Up

#### 1. Clone the Repository:

```bash
git clone https://github.com/radheshyamrathore/report_management_app.git
cd report_management_app

#### 1. Install Ruby And Rails Dependencies:

```bash
bundle install

