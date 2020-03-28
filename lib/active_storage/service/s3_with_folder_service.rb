require "aws-sdk-s3"
require "active_storage/service/s3_service"
require "active_support/core_ext/numeric/bytes"

module ActiveStorage
  class Service
    class S3WithFolderService < Service::S3Service
      attr_reader :client, :bucket, :folder, :upload_options

      def initialize(bucket:, upload: {}, **options)
        @folder = options.delete(:folder)

        super(bucket: bucket, upload: upload, **options)
      end

      private

      def object_for(key)
        path = folder.present? ? File.join(folder, key) : key

        bucket.object(path)
      end
    end
  end
end
