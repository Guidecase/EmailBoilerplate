module ActionMailer
  module EmailBoilerplate
    module Helper
      def mail_table_tag(options={}, &block)
        content_tag :table, options.merge(normal_table_options), &block
      end

      def mail_table_cell_tag(options={}, &block)
        content_tag :td, normal_table_cell_options, &block
      end

      def mail_image_tag(source, options = {})
        image_tag source, options.merge(normal_image_options)
      end

      def mail_link_to(body, url, options = {})
        link_to body, url, options.merge(normal_link_options)
      end

      def mail_paragraph(&block)
        content_tag :p, normal_paragraph_options, &block
      end

      private

        def normal_paragraph_options
          {:style => { :margin => '1em 0'} }
        end

        def normal_table_options
          {:cellpadding => 0, :cellspacing => 0, :border => 0, :width => '100%'}
        end

        def normal_table_cell_options
          {:style => { 'border-collapse' => 'collapse'} }
        end

        def normal_image_options
          {:border => 0}
        end

        def normal_link_options
          {:style => 'color:inherit'}
        end
    end
  end
end