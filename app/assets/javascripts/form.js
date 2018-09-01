

$(function() {
  //スライダーの値を表示
  $("#picture_font_size").mousemove(function() { 
    $form = $(this);
    $input_value = $form.val();
    $label = $form.prev();
    $label.text("文字サイズ：" + $input_value);
  })
  
  $("#picture_font_size").click(function() { 
    $form = $(this);
    var input_value = $form.val();
    $label = $form.prev();
    $label.text("文字サイズ：" + input_value);
  })

    //帯横幅スライダーの値を表示
    $("#picture_band_width").mousemove(function() { 
      $form = $(this);
      $input_value = $form.val();
      $label = $form.prev();
      $label.text("帯横幅：" + $input_value + "%");
    })
    
    $("#picture_band_width").click(function() { 
      $form = $(this);
      var input_value = $form.val();
      $label = $form.prev();
      $label.text("帯横幅：" + input_value+ "%");
    })

      //スライダーの値を表示
  $("#picture_band_height").mousemove(function() { 
    $form = $(this);
    $input_value = $form.val();
    $label = $form.prev();
    $label.text("帯縦幅：" + $input_value + "%");
  })
  
  $("#picture_band_height").click(function() { 
    $form = $(this);
    var input_value = $form.val();
    $label = $form.prev();
    $label.text("帯縦幅：" + input_value + "%");
  })
})