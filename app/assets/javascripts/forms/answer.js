/**
 * Created by Vileven on 21.12.16.
 */

function render_answer(data) {
    var text_field = document.getElementById('answer-content-field');
    text_field.value = '';
    var container = document.getElementById('am-ajax');

    var buffer = container.innerHTML;

    container.innerHTML = "";

    var user_rating = document.createElement('div');
    user_rating.setAttribute('class', 'am-answer-rating');

    var div_row = document.createElement('div');
    div_row.setAttribute('class', 'row');

    var am_answer = document.createElement('div');
    am_answer.setAttribute('class', 'am-answer');

    var col_xs_1 = document.createElement('div');
    col_xs_1.setAttribute('class', 'col-xs-1');

    div_row.appendChild(am_answer);
    am_answer.appendChild(col_xs_1);
    col_xs_1.appendChild(user_rating);

    var a = document.createElement('a');
    a.setAttribute('href', data['like']);
    a.setAttribute('class', 'vote');
    a.setAttribute('data-method', 'put');
    a.setAttribute('data-remote', 'true');
    a.setAttribute('rel', 'nofollow');

    var span = document.createElement('span');
    span.textContent = '+';

    a.appendChild(span);
    user_rating.appendChild(a);

    span = document.createElement('span');
    span.setAttribute('class', 'votes-count');
    span.setAttribute('data-id', data['id']);
    span.textContent = data['rating'];

    user_rating.appendChild(span);

    a = document.createElement('a');
    a.setAttribute('href', data['dislike']);
    a.setAttribute('class', 'vote');
    a.setAttribute('data-method', 'put');
    a.setAttribute('data-remote', 'true');
    a.setAttribute('rel', 'nofollow');

    span = document.createElement('span');
    span.textContent = '-';
    a.appendChild(span);
    user_rating.appendChild(a);
    container.appendChild(div_row);

    var user_info = document.createElement('div');
    user_info.setAttribute('class', 'am-answer-user-info col-sm-2');

    var div = document.createElement('div');
    var img = document.createElement('img');
    img.setAttribute('class', 'img-circle');
    img.setAttribute('src', data['user_avatar']);
    div.appendChild(img);
    user_info.appendChild(div);
    a = document.createElement('a');
    a.setAttribute('href', data['user_path']);
    span = document.createElement('span');
    span.textContent = data['user_name'];
    a.appendChild(span);
    user_info.appendChild(a);
    am_answer.appendChild(user_info);

    var answer_body = document.createElement('div');
    answer_body.setAttribute('class', 'col-sm-9 am-answer-body');
    var p = document.createElement('p');
    p.textContent = data['content'].toString();
    answer_body.appendChild(p);
    div = document.createElement('div');
    div.setAttribute('class', 'answer-timestamp');
    div.textContent = data['time'];
    answer_body.appendChild(div);

    am_answer.appendChild(answer_body);
    am_answer.setAttribute('id', 'result');

    container.innerHTML += buffer;
    am_answer.setAttribute('id', 'result');
    document.getElementById('am-answers-container').setAttribute('class', '');
    location.hash = 'result';
}



$(document).ready(function(){
    $("#answer_form").bind("ajax:success",
        function(xhr, data, status) {
            // data is already an object
            render_answer(data)
        })
});
