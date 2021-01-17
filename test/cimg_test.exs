defmodule CImgTest do
  use ExUnit.Case
  doctest CImg
  
  test "measure" do
    img = CImg.create("test/IMG_9458.jpg")
    assert %CImg{} = img

           {time, result} = :timer.tc(CImgTest, :myresize, [img])
            IO.inspect "time: #{time} μs"
            IO.inspect "-------------"
	result
	|> CImg.save("test/myresize.jpg")

  end

  def myresize(img) do

    img
    |> CImg.resize([416, 416])
    |> CImg.mirror(:x)
    |> CImg.get_gray()
    |> CImg.draw_box(0.2, 0.3, 0.4, 0.6, {255, 0, 0})

  end

end
