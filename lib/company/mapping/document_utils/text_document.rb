module Company
  module Mapping
    # A simple text document
    class TextDocument
      attr_accessor :id, :contents, :tokenizer

      def initialize(id = SecureRandom.uuid, contents = "", tokenizer = BasicTokenizer.new)
        @id, @contents, @tokenizer = id, contents, tokenizer
      end

      def bag_of_words
        @tf = TermFrequency.new(@tokenizer)
        @bag_of_words = @tf.calculate(@contents)
        @bag_of_words
      end

      def equal?(o)
        o.class == self.class && o.state == self.state
      end

      def ==(o)
        o.class == self.class && o.state == self.state
      end

      def to_s
        "TextDocument:{#{id},#{contents}}"
      end

      protected
      def state
        [@id]
      end
    end
  end
end
