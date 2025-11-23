# Setup Guide

Complete step-by-step guide to set up the Support Case Management Workflow.

## Prerequisites

- n8n instance (self-hosted or cloud)
- Google Cloud Project with enabled APIs:
  - Google Drive API
  - Google Sheets API
- SMTP server access for email notifications

## Step 1: Google Cloud Setup

### 1.1 Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing
3. Note the Project ID

### 1.2 Enable Required APIs

```bash
# Enable Google Drive API
gcloud services enable drive.googleapis.com

# Enable Google Sheets API
gcloud services enable sheets.googleapis.com
```

Or via Console:
1. Navigate to **APIs & Services** → **Library**
2. Search for "Google Drive API" and click **Enable**
3. Search for "Google Sheets API" and click **Enable**

### 1.3 Create OAuth 2.0 Credentials

1. Go to **APIs & Services** → **Credentials**
2. Click **Create Credentials** → **OAuth client ID**
3. Select **Web application**
4. Add authorized redirect URI:
   ```
   https://your-n8n-instance.com/rest/oauth2-credential/callback
   ```
5. Save the Client ID and Client Secret

## Step 2: Google Sheets Preparation

### 2.1 Create Support Cases Sheet

1. Create a new Google Sheet
2. Name it "Support Cases"
3. Add the following headers in row 1:

| A | B | C | D | E | F | G | H | I | J | K | L | M | N |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Case ID | Date | Support Type | Market | Name | Email | Phone | Company | Serial Number | Article Number | Product Model | Description | Files Folder | Status |

### 2.2 Get Sheet ID

From the URL: `https://docs.google.com/spreadsheets/d/{SHEET_ID}/edit`

Copy the `{SHEET_ID}` part.

## Step 3: n8n Configuration

### 3.1 Import Workflow

1. Open n8n UI
2. Click **Workflows** → **Import**
3. Select `workflows/support-case-workflow.json`
4. Click **Import**

### 3.2 Configure Google Drive Credential

1. Go to **Credentials** → **New**
2. Select **Google Drive OAuth2 API**
3. Enter:
   - **Client ID**: From Google Cloud Console
   - **Client Secret**: From Google Cloud Console
4. Click **Connect my account**
5. Complete OAuth flow
6. Save as "Google Drive Account"

### 3.3 Configure Google Sheets Credential

1. Go to **Credentials** → **New**
2. Select **Google Sheets OAuth2 API**
3. Enter:
   - **Client ID**: (Same as Drive)
   - **Client Secret**: (Same as Drive)
4. Click **Connect my account**
5. Complete OAuth flow
6. Save as "Google Sheets Account"

### 3.4 Configure SMTP Credential

1. Go to **Credentials** → **New**
2. Select **SMTP**
3. Enter your SMTP settings:
   ```
   Host: smtp.gmail.com (or your SMTP server)
   Port: 587
   Security: STARTTLS
   Username: your-email@example.com
   Password: your-app-password
   ```
4. Save as "SMTP Account"

### 3.5 Update Workflow Settings

Open the imported workflow and update:

**Google Sheets Node:**
```javascript
// Replace with your Sheet ID
"documentId": "YOUR_GOOGLE_SHEET_ID_HERE"
```

**Email Node:**
```javascript
// Replace with your support email
"fromEmail": "your-support@example.com"
```

## Step 4: Test the Workflow

### 4.1 Activate Workflow

1. Open the workflow
2. Toggle **Active** switch to ON
3. Copy the webhook URL

### 4.2 Test Request

```bash
curl -X POST YOUR_WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Technical Support",
    "name": "Test User",
    "email": "test@example.com",
    "phone": "+46701234567",
    "description": "Test case",
    "market": "SE"
  }'
```

### 4.3 Verify Results

Check:
- ✅ New row in Google Sheets
- ✅ Folder created in Google Drive (if files included)
- ✅ Confirmation email received
- ✅ JSON response with case ID

## Step 5: Production Deployment

### 5.1 Security Settings

1. Enable webhook authentication (if needed)
2. Set up rate limiting
3. Configure error notifications

### 5.2 Monitoring

1. Enable execution retention
2. Set up error notifications
3. Configure logging level

### 5.3 Backup

Export workflow regularly:
```bash
# Via n8n CLI
n8n export:workflow --id=YOUR_WORKFLOW_ID --output=backup/
```

## Troubleshooting

### Google Drive Files Not Uploading

**Issue:** Files are not being uploaded to Google Drive

**Solutions:**
- Verify OAuth scopes include `drive.file`
- Check folder creation permissions
- Ensure base64 encoding for file data

### Google Sheets Not Updating

**Issue:** Cases not logged in spreadsheet

**Solutions:**
- Verify Sheet ID is correct
- Check column names match exactly
- Ensure OAuth token is valid

### Emails Not Sending

**Issue:** Confirmation emails not delivered

**Solutions:**
- Verify SMTP credentials
- Check spam folder
- Enable "less secure app access" (if using Gmail)
- Use App Password instead of account password

### Webhook Timeout

**Issue:** Requests timing out

**Solutions:**
- Move Response node before time-consuming operations
- Enable async execution
- Increase timeout in n8n settings

## Support

For issues or questions:
- Check [n8n documentation](https://docs.n8n.io)
- Visit [n8n community forum](https://community.n8n.io)
- Review workflow execution logs
