import json

def handler(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps({
      "message": "Deleting a book club by it's id",
    }),
  }