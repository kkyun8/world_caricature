import AWS from "aws-sdk";
require("dotenv").config();

export default {
  async created() {
    this.s3 = await this.getS3();
  },
  data() {
    return {
      s3: "",
    };
  },
  methods: {
    getS3() {
      const albumBucketName = process.env.AWS_BUCKET;

      AWS.config.region = process.env.AWS_DEFAULT_REGION;
      AWS.config.credentials = new AWS.CognitoIdentityCredentials({
        IdentityPoolId: process.env.AWS_IDENTITY_POOL_ID,
      });

      const s3 = new AWS.S3({
        params: { Bucket: albumBucketName },
      });

      return s3;
    },
  },
};
