#Market Research Report

This application is a lightweight internal tool built with Ruby on Rails 8.0.2 for managing market research reports within an organization. It features a user authentication system using Devise, supporting both admin and regular users. Admin users have access to all reports, while regular users can only manage their own. Each report includes attributes such as title, rich-text description (via TinyMCE), category, status (draft, published, or archived), and a publication date. Users can also upload a logo for each report using ActiveStorage.
The app includes filtering and pagination functionality, allowing reports to be filtered by category and status, with paginated results handled through Kaminari. When a report is marked as "published," a background job is triggered via Sidekiq to log the publication details to a file or Rails logger. The frontend is styled using Bootstrap 5, with jQuery enhancements like a character counter for the description field.

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
