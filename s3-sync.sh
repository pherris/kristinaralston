#!/bin/bash

echo "Copy static assets with one year expiry."
aws s3 sync ./ s3://kristinaralston/ --cache-control max-age=31536000 --exclude '*.html' --exclude '*.sh' --exclude '.git/*'

echo "Copy HTML files with one day expiry."
aws s3 sync ./ s3://kristinaralston/ --cache-control max-age=86400 --include '*.html' --exclude '*.sh' --exclude '.git/*'

echo "Invalidate CloudFront cache."
aws cloudfront create-invalidation --distribution-id E2V7HA8PCMELU5 --paths /