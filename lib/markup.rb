require 'rdiscount'

module Markup
  class Runner
    
    class OutputExists < StandardError; end
    
    def initialize(source, options = {})
      @source  = source
      @options = options
    end
    
    def generate_html!
      if output_file_exists? && should_not_overwrite_output_file?
        raise OutputExists, output_filename
      else
        File.open(output_filename, 'w') { |f| f.write(html_output) }
      end
    end    
    
    def output_filename
      @options[:output] || File.basename(@source, '.*') + '.html'
    end
    
    private
    def html_output
      RDiscount.new(File.read(@source)).to_html
    end
    
    def output_file_exists?
      File.file?(output_filename)
    end
    
    def should_not_overwrite_output_file?
      !@options[:force]            
    end
  end
end