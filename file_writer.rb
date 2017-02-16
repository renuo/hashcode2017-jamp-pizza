class FileWriter

   def initialize(solution, output_path)
        @solution = solution
        @output_path = output_path
   end

   def write_out
      File.open(@output_path, 'wb') do |file|
         file.puts @solution.slices.count
         @solution.slices.each do |slice|
            file.puts slice
         end
      end
   end
end