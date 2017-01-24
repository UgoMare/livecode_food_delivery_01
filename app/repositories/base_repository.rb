class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    @csv_options = {headers: :first_row, header_converters: :symbol}
    load_csv if File.exist?(@csv_file)
end

  def add(element)
    element.id = @next_id
    @elements << element
    write_to_csv
    @next_id += 1
  end

  def find(id)
    @elements.select { |element| element.id == id }[0]
  end

  def list
    @elements
  end

  def write_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << self.class.create_array
      @elements.each do |element|
        csv << element.to_array
      end
    end
  end


  def load_csv
    CSV.foreach(@csv_file, @csv_options)  do |row|
    row[:id] = row[:id].to_i
    @next_id = row[:id] + 1
    @elements << self.create_instance(row)
    end
  end
end
