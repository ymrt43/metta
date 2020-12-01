$(function() {
  function appendLessonList(lesson) {
    // 日時フォーマット
    var date = new Date(lesson.date);
    var sTime = new Date(lesson.start_time);
    var eTime = new Date(lesson.end_time);
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var week_japanese = ["日", "月", "火", "水", "木", "金", "土"];
    var week = week_japanese[date.getDay()];
    var s_h = sTime.getHours();
    var s_m = sTime.getMinutes();
    var e_h = eTime.getHours();
    var e_m = eTime.getMinutes();
    var s_hh = ('0' + s_h).slice(-2);
    var s_mm = ('0' + s_m).slice(-2);
    var e_hh = ('0' + e_h).slice(-2);
    var e_mm = ('0' + e_m).slice(-2);
    
    let html = `<a class="Link1" href="/lessons/${lesson.id}">
                  <li class="LessonList__block">
                    <div class="Lesson__date">
                      ${month}月${day}日(${week})
                    </div>
                    <div class="Lesson__startTime">
                      ${s_hh}:${s_mm}
                    </div>
                    <spam>-</spam>
                    <div class="Lesson__endTime">
                      ${e_hh}:${e_mm}
                    </div>
                    <div class="Lesson__course">
                      ${lesson.coursename}
                    </div>
                    <div class="Lesson__fee">
                      <i class="fas fa-tag Lesson__fee--icon"></i>
                    <span>
                      ¥
                    </span>
                    <span>
                      ${lesson.fee}
                    </span>
                    <span>
                      (税抜)
                    </span>
                    </div>
                  </li>
                </a>`
    $(".LessonList").append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='Lesson__msg'>${ msg }</div>`
    $(".LessonList").append(html);
  }

  $(".Main__search--selectBar").on("change", function() {
    let input = $(".Main__search--selectBar").val();
    $.ajax({
      type: 'GET',
      url: '/lessons/search',
      data: { course_id: input },
      dataType: 'json'
    })
    .done(function(lessons) {
      $('.LessonList').empty();
      if (lessons.length != 0) {
        lessons.forEach(function(lesson) {
          appendLessonList(lesson);
        })
      }
      else {
        appendErrMsgToHTML("こちらのコースのレッスン予定はありません");
      }
    })
    .fail(function() {
      alert("通信エラーです！");
    });
  });


});