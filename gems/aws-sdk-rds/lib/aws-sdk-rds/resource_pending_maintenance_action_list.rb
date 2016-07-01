# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module RDS
    class ResourcePendingMaintenanceActionList

      extend Aws::Deprecations

      # @overload def initialize(arn, options = {})
      #   @param [String] arn
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :arn
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @arn = extract_arn(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def arn
        @arn
      end
      alias :resource_identifier :arn

      # A list that provides details about the pending maintenance actions for
      # the resource.
      # @return [Array<Types::PendingMaintenanceAction>]
      def pending_maintenance_action_details
        data.pending_maintenance_action_details
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # @raise [Errors::ResourceNotLoadable]
      # @api private
      def load
        msg = "#load is not implemented, data only available via enumeration"
        raise Errors::ResourceNotLoadable, msg
      end
      alias :reload :load

      # @raise [Errors::ResourceNotLoadableError] Raises when {#data_loaded?} is `false`.
      # @return [Types::ResourcePendingMaintenanceActions]
      #   Returns the data for this {ResourcePendingMaintenanceActionList}.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Associations

      # @return [PendingMaintenanceAction::Collection]
      def pending_maintenance_actions
        batch = []
        data.pending_maintenance_action_details.each do |p|
          batch << PendingMaintenanceAction.new(
            target_arn: @arn,
            name: p.action,
            data: p,
            client: @client
          )
        end
        PendingMaintenanceAction::Collection.new([batch], size: batch.size)
      end

      # @deprecated
      # @api private
      def identifiers
        { arn: @arn }
      end
      deprecated(:identifiers)

      private

      def extract_arn(args, options)
        value = args[0] || options.delete(:arn)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :arn"
        else
          msg = "expected :arn to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<ResourcePendingMaintenanceActionList>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end