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
- **Bootstrap 5:** For responsive layout
- **jQuery:** For frontend interactions

## Installation

### Prerequisites

- Ruby (version 3.2.6)
- Rails (version 8.0.2)
- PostgreSQL
- Redis (for Sidekiq)
- Node.js and Yarn

- Node.js and Yarn

### Steps to Set Up

#### 1. Clone the Repository:

```
git clone https://github.com/radheshyamrathore/report_management_app.git
cd report_management_app
```

#### 2. Install Ruby and Rails Dependencies:
```
bundle install
```
### 3. Setup Database
```
rails db:create
rails db:migrate
rails db:seed  # This will populate the database with sample data
```
### 4. Install JavaScript Dependencies:
```
yarn install
```
#### 5. Start Redis (required for Sidekiq)
```
sudo apt install redis-server

sudo service redis-server start

```
#### 6. Start Sidekiq (in a separate terminal window)
```
bundle exec sidekiq
```

#### 6. Start rails server:
```
rails s
```
Now visit [http://localhost:3000](http://localhost:3000) in your browser to see the application in action.



