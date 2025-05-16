import json

def handler(event, context):
  return {
    "statusCode": 200,
    "body": json.dumps({
      "message": "Getting single book club by id",
    }),
  }