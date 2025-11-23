#!/bin/bash

# Support Case Workflow - cURL Examples
# Replace YOUR_WEBHOOK_URL with your actual webhook URL

WEBHOOK_URL="https://your-n8n-instance.com/webhook/support-case"

echo "=== Support Case Workflow Test Examples ==="
echo ""

# Example 1: Minimal request (required fields only)
echo "1. Minimal Request"
echo "-------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Technical Support",
    "name": "Test User",
    "email": "test@example.com",
    "phone": "+46701234567",
    "description": "Test case"
  }'
echo -e "\n"

# Example 2: Full request with all fields
echo "2. Full Request with Product Details"
echo "-------------------------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Technical Support",
    "name": "Anna Andersson",
    "email": "anna.andersson@example.com",
    "phone": "+46701234567",
    "company": "Garden Services AB",
    "serialNumber": "SN987654321",
    "articleNumber": "ART-450X",
    "productModel": "Product Model 450X",
    "description": "Device not charging properly. Battery drains within 1 hour.",
    "market": "SE"
  }'
echo -e "\n"

# Example 3: Request with file attachment
echo "3. Request with File Attachment"
echo "--------------------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Warranty Claim",
    "name": "Erik Eriksson",
    "email": "erik@example.com",
    "phone": "+46709876543",
    "serialNumber": "SN555444333",
    "description": "Component assembly broken after 6 months",
    "market": "SE",
    "files": [
      {
        "filename": "broken-blade.jpg",
        "data": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
      }
    ]
  }'
echo -e "\n"

# Example 4: Different support types
echo "4. Product Information Request"
echo "------------------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Product Information",
    "name": "Maria Svensson",
    "email": "maria@example.com",
    "phone": "+46708765432",
    "description": "Need information about winter storage recommendations",
    "market": "SE"
  }'
echo -e "\n"

# Example 5: Different market
echo "5. Request from Different Market"
echo "---------------------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Parts Request",
    "name": "Hans Mueller",
    "email": "hans@example.de",
    "phone": "+4917012345678",
    "company": "Mueller Services",
    "serialNumber": "SN111222333",
    "articleNumber": "ART-330X",
    "productModel": "Product Model 330X",
    "description": "Need replacement parts and screws",
    "market": "DE"
  }'
echo -e "\n"

# Example 6: Service request
echo "6. Service Request"
echo "------------------"
curl -X POST $WEBHOOK_URL \
  -H "Content-Type: application/json" \
  -d '{
    "supportType": "Service Request",
    "name": "Lars Olsson",
    "email": "lars@example.com",
    "phone": "+46707654321",
    "company": "Olsson Services",
    "serialNumber": "SN999888777",
    "productModel": "Product Model 435X",
    "description": "Annual service and maintenance needed",
    "market": "SE"
  }'
echo -e "\n"

echo "=== All tests completed ==="
