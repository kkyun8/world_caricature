import AWS from "aws-sdk";
require("dotenv").config();

export default {
  computed: {
    s3() {
      return this.getS3();
    },
    albumBucket() {
      return process.env.AWS_BUCKET;
    },
  },
  methods: {
    getS3() {
      const albumBucketName = process.env.AWS_BUCKET;

      AWS.config.region = process.env.AWS_DEFAULT_REGION;
      AWS.config.credentials = new AWS.CognitoIdentityCredentials({
        IdentityPoolId: process.env.AWS_IDENTITY_POOL_ID,
      });

      const s3 = new AWS.S3({
        apiVersion: "2006-03-01",
        params: { Bucket: albumBucketName },
        accessKeyId: process.env.AWS_ACCESS_KEY_ID,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
      });

      return s3;
    },
  },
};
