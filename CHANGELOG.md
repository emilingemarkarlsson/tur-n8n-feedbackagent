# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-23

### Added
- Initial workflow release
- Webhook trigger for receiving support cases
- Automatic case ID generation (HSQ-YYYY-MMDDHHMMSS format)
- Google Drive integration for file storage
- Organized folder structure per case
- Google Sheets logging for centralized tracking
- Email confirmation system
- Support for multiple file uploads
- Multi-market support (SE, NO, DK, FI, DE, UK, US)
- Product information fields (serial number, article number, model)
- Response node for immediate API feedback

### Supported Fields
- Support Type
- Customer Information (Name, Email, Phone, Company)
- Product Details (Serial Number, Article Number, Model)
- Case Description
- Market Selection
- File Attachments
- Status Tracking

### Integrations
- Google Drive OAuth2
- Google Sheets OAuth2
- SMTP Email

## [Unreleased]

### Planned Features
- Priority level assignment
- SLA tracking
- Case assignment to support agents
- Status update notifications
- Customer portal for case tracking
- Integration with ticketing systems
- Automated case categorization
- Response templates
- Knowledge base integration
- Multi-language support for emails
