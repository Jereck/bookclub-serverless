import json

def handler(event, context):
  return {
    "statusCode": 200,
    "headers": {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
    "body": json.dumps({
      "message": "Updating book on bookshelf",
    }),
  }