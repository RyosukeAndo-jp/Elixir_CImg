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

  test "create" do
    img = CImg.create("test/IMG_9458.jpg")
    assert %CImg{} = img
    assert [2448,3264] = CImg.get_wh(img)
    assert :ok = CImg.save(img, "test/IMG_XXXX.jpg")
  end

  def myresize(img) do

    img
    |> CImg.resize([416, 416])
    |> CImg.mirror(:y)
    |> CImg.get_gray()
    |> CImg.draw_box(0.2, 0.3, 0.4, 0.6, {255, 0, 0})

  end

  test "resize(416, 416)" do
    img = CImg.create("test/IMG_9458.jpg")
    assert %CImg{} = img
    img
    |> CImg.resize([416, 416])
    |> CImg.mirror(:y)
    |> CImg.get_gray()
    |> CImg.draw_box(0.2, 0.3, 0.4, 0.6, {255, 0, 0})
    |> CImg.save("test/416x416.jpg")
  end

end