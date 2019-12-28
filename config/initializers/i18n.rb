module I18n
  module JS
    IMPORT_I18N_LINE = "import I18n from 'i18n-js';".freeze

    def self.export
      export_i18n_js

      translation_segments.each do |segment|
        segment.save!

        add_18n_js_import(segment)
      end
    end

    def self.add_18n_js_import(segment)
      existed_translations = File.open(segment.file, "r", &:readlines)
      new_lines = [IMPORT_I18N_LINE] + existed_translations

      File.open(segment.file, "w") { |f| f << new_lines.join("\n") }
    end
  end
end
