require 'test_helper'
require 'fileutils'

class MarkupTest < Test::Unit::TestCase
  
  include FileUtils
  
  def setup
    @source = File.dirname(__FILE__) + '/../README.markdown'
    @output = File.dirname(__FILE__) + '/output.html'
    clear_output_file!
  end
  
  context '#output_filename' do
    context 'with no options' do
      should 'set output filename to input filename + "html"' do
        runner   = Markup::Runner.new(@source)
        expected = 'README.html'
        actual   = runner.output_filename

        assert_equal expected, actual
      end          
    end
    
    context 'with options[:output] set' do
      should 'use options[:output] as output filename' do
        runner   = Markup::Runner.new(@source, :output => 'instructions.html')
        expected = 'instructions.html'
        actual   = runner.output_filename
        
        assert_equal expected, actual
      end
    end
  end
  
  context '#generate_html!' do    
    context 'when options[:force] != true' do
      should 'raise an exception if the output file exists' do
        assert_raise(Markup::Runner::OutputExists) do
          Markup::Runner.new(@source, :output => @output).generate_html!
        end
      end
      
      should 'create output file if it does not exist' do
        new_output = File.dirname(__FILE__) + '/new_output.html'
        assert !File.file?(new_output)
        
        Markup::Runner.new(@source, :output => new_output).generate_html!
        assert File.file?(new_output)
        
        rm(new_output) if File.file?(new_output)
      end      
    end
    
    context 'when options[:force] == true' do
      should 'raise no exceptions, even when output file exists' do
        assert_nothing_raised do
          Markup::Runner.new(@source, :output => @output, :force => true).generate_html!          
        end
      end
      
      should 'overwrite contents of output file if it exists' do        
        old_contents = File.read(@output)
        Markup::Runner.new(@source, :output => @output, :force => true).generate_html!
        new_contents = File.read(@output)
        
        assert new_contents != old_contents
        assert new_contents =~ /^<h1>/, "New content doesn't seem to contain any HTML"
      end      
    end
  end
  
  def clear_output_file!
    File.open(@output, 'w') { |f| f.write nil }
  end
end