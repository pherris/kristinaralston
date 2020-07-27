#!/bin/bash

echo "Copy static assets with one year expiry."
aws s3 sync ./ s3://ralston-kristina-web/ --cache-control max-age=31536000 --exclude '*.html' --exclude '*.sh' --exclude '.git/*' --exclude 'node_modules/*'  --exclude 'LICENSE' --exclude 'README.md'  --exclude 'gulpfile.js' --exclude 'package.json' --exclude 'package-lock.json'

echo "Copy HTML files with one day expiry."
aws s3 sync ./ s3://ralston-kristina-web/ --cache-control max-age=86400 --include '*.html' --exclude '*.sh' --exclude '.git/*' --exclude 'node_modules/*'  --exclude 'LICENSE' --exclude 'README.md'  --exclude 'gulpfile.js' --exclude 'package.json' --exclude 'package-lock.json'

echo "Invalidate CloudFront cache."
aws cloudfront create-invalidation --distribution-id E34Z9BDDLMC63N --paths /
