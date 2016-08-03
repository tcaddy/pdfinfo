class Pdfinfo
  module RSpec
    module ExampleGroup
      module ClassMethods
        def self.extended(host)
          host.class_eval do
            let(:user_password) { nil }
            let(:response_modification_handler) { Proc.new {} }
            let(:encrypted_pdf_path) { fixture_path('pdfs/encrypted.pdf') }
            let(:unencrypted_pdf_path) { fixture_path('pdfs/unencrypted.pdf') }
            let(:trimbox_pdf_path) { fixture_path('pdfs/trimbox.pdf') }

            let(:pdfinfo) { described_class.new(pdf_path, user_password: user_password) }
            let(:pdfinfo_with_trim) { described_class.new(pdf_path, box: true) }
          end
        end

        def modify_pdfinfo_response(&handler)
          let(:response_modification_handler) { handler }
        end

        def use_encrypted!
          let(:user_password) { 'foo' }
          let(:pdf_path) { encrypted_pdf_path }
        end

        def use_unencrypted!
          let(:pdf_path) { unencrypted_pdf_path }
        end
      end
    end
  end
end