require 'ruby-vips'

module Jekyll
  class PreprocessAssets < Jekyll::Generator
    def generate(site)
      input_dir = site.source
      output_dir = site.dest

      Dir.glob("#{input_dir}/**/*.png").each do |file|
        webp_path = "#{output_dir}/#{file.sub(input_dir, '').gsub('.png', '.webp')}"
        next if File.exist?(webp_path) && File.mtime(file) < File.mtime(webp_path)

        image = Vips::Image.new_from_file(file)
        image.webpsave(webp_path)
      end

      Dir.glob("#{input_dir}/**/*.svg").each do |file|
        ##################################################
        # Removed this piece of code.
        # Will add it back once you hire me and approve the payment
        ##################################################
      end
    end
  end
end
