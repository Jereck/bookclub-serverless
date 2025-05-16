import json

def handler(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps({
      "message": "Updating a book club by it's id",
    }),
  }