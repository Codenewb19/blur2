class Image
  def initialize(image)
    @image= image
  end

  def output_image
    @image.each do |row|
      puts row.join('')
    end
  end

  def get_ones
  #get coords of all 1's [[0,1],[0,2],[0,3]]
    ones = []
    
    @image.each_with_index do |row, row_idx|
      row.each_with_index do |column, column_idx|
        if column == 1
         ones.push([row_idx, column_idx])  
        end 
      end
    end

    ones
  end
  
  def blur
    coords = get_ones #[[2,1]]
    coords.each do |index|
      #[2,1]
      row = index[0]
      col = index[1]

      #up 
      @image[row-1][col] = 1 if row > 0
      #left
      @image[row][col-1] = 1 if col > 0
      #bottom
      @image[row+1][col] = 1 if row < @image.length - 1 
      #right    
      @image[row][col+1] = 1 if col < @image[0].length - 1
    end

  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

image.blur
image.output_image

