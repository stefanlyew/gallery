!function(t,e){t.rails!==e&&t.error("jquery-ujs has already been loaded!");var i;t.rails=i={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",buttonClickSelector:"button[data-remote]",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input[type=file]",linkDisableSelector:"a[data-disable-with]",CSRFProtection:function(e){var i=t('meta[name="csrf-token"]').attr("content");i&&e.setRequestHeader("X-CSRF-Token",i)},fire:function(e,i,n){var s=t.Event(i);return e.trigger(s,n),s.result!==!1},confirm:function(t){return confirm(t)},ajax:function(e){return t.ajax(e)},href:function(t){return t.attr("href")},handleRemote:function(n){var s,o,a,r,l,h,c,u;if(i.fire(n,"ajax:before")){if(r=n.data("cross-domain"),l=r===e?null:r,h=n.data("with-credentials")||null,c=n.data("type")||t.ajaxSettings&&t.ajaxSettings.dataType,n.is("form")){s=n.attr("method"),o=n.attr("action"),a=n.serializeArray();var d=n.data("ujs:submit-button");d&&(a.push(d),n.data("ujs:submit-button",null))}else n.is(i.inputChangeSelector)?(s=n.data("method"),o=n.data("url"),a=n.serialize(),n.data("params")&&(a=a+"&"+n.data("params"))):n.is(i.buttonClickSelector)?(s=n.data("method")||"get",o=n.data("url"),a=n.serialize(),n.data("params")&&(a=a+"&"+n.data("params"))):(s=n.data("method"),o=i.href(n),a=n.data("params")||null);u={type:s||"GET",data:a,dataType:c,beforeSend:function(t,s){return s.dataType===e&&t.setRequestHeader("accept","*/*;q=0.5, "+s.accepts.script),i.fire(n,"ajax:beforeSend",[t,s])},success:function(t,e,i){n.trigger("ajax:success",[t,e,i])},complete:function(t,e){n.trigger("ajax:complete",[t,e])},error:function(t,e,i){n.trigger("ajax:error",[t,e,i])},crossDomain:l},h&&(u.xhrFields={withCredentials:h}),o&&(u.url=o);var p=i.ajax(u);return n.trigger("ajax:send",p),p}return!1},handleMethod:function(n){var s=i.href(n),o=n.data("method"),a=n.attr("target"),r=t("meta[name=csrf-token]").attr("content"),l=t("meta[name=csrf-param]").attr("content"),h=t('<form method="post" action="'+s+'"></form>'),c='<input name="_method" value="'+o+'" type="hidden" />';l!==e&&r!==e&&(c+='<input name="'+l+'" value="'+r+'" type="hidden" />'),a&&h.attr("target",a),h.hide().append(c).appendTo("body"),h.submit()},disableFormElements:function(e){e.find(i.disableSelector).each(function(){var e=t(this),i=e.is("button")?"html":"val";e.data("ujs:enable-with",e[i]()),e[i](e.data("disable-with")),e.prop("disabled",!0)})},enableFormElements:function(e){e.find(i.enableSelector).each(function(){var e=t(this),i=e.is("button")?"html":"val";e.data("ujs:enable-with")&&e[i](e.data("ujs:enable-with")),e.prop("disabled",!1)})},allowAction:function(t){var e,n=t.data("confirm"),s=!1;return n?(i.fire(t,"confirm")&&(s=i.confirm(n),e=i.fire(t,"confirm:complete",[s])),s&&e):!0},blankInputs:function(e,i,n){var s,o,a=t(),r=i||"input,textarea",l=e.find(r);return l.each(function(){if(s=t(this),o=s.is("input[type=checkbox],input[type=radio]")?s.is(":checked"):s.val(),!o==!n){if(s.is("input[type=radio]")&&l.filter('input[type=radio]:checked[name="'+s.attr("name")+'"]').length)return!0;a=a.add(s)}}),a.length?a:!1},nonBlankInputs:function(t,e){return i.blankInputs(t,e,!0)},stopEverything:function(e){return t(e.target).trigger("ujs:everythingStopped"),e.stopImmediatePropagation(),!1},disableElement:function(t){t.data("ujs:enable-with",t.html()),t.html(t.data("disable-with")),t.bind("click.railsDisable",function(t){return i.stopEverything(t)})},enableElement:function(t){t.data("ujs:enable-with")!==e&&(t.html(t.data("ujs:enable-with")),t.removeData("ujs:enable-with")),t.unbind("click.railsDisable")}},i.fire(t(document),"rails:attachBindings")&&(t.ajaxPrefilter(function(t,e,n){t.crossDomain||i.CSRFProtection(n)}),t(document).delegate(i.linkDisableSelector,"ajax:complete",function(){i.enableElement(t(this))}),t(document).delegate(i.linkClickSelector,"click.rails",function(n){var s=t(this),o=s.data("method"),a=s.data("params");if(!i.allowAction(s))return i.stopEverything(n);if(s.is(i.linkDisableSelector)&&i.disableElement(s),s.data("remote")!==e){if(!(!n.metaKey&&!n.ctrlKey||o&&"GET"!==o||a))return!0;var r=i.handleRemote(s);return r===!1?i.enableElement(s):r.error(function(){i.enableElement(s)}),!1}return s.data("method")?(i.handleMethod(s),!1):void 0}),t(document).delegate(i.buttonClickSelector,"click.rails",function(e){var n=t(this);return i.allowAction(n)?(i.handleRemote(n),!1):i.stopEverything(e)}),t(document).delegate(i.inputChangeSelector,"change.rails",function(e){var n=t(this);return i.allowAction(n)?(i.handleRemote(n),!1):i.stopEverything(e)}),t(document).delegate(i.formSubmitSelector,"submit.rails",function(n){var s=t(this),o=s.data("remote")!==e,a=i.blankInputs(s,i.requiredInputSelector),r=i.nonBlankInputs(s,i.fileInputSelector);if(!i.allowAction(s))return i.stopEverything(n);if(a&&s.attr("novalidate")==e&&i.fire(s,"ajax:aborted:required",[a]))return i.stopEverything(n);if(o){if(r){setTimeout(function(){i.disableFormElements(s)},13);var l=i.fire(s,"ajax:aborted:file",[r]);return l||setTimeout(function(){i.enableFormElements(s)},13),l}return i.handleRemote(s),!1}setTimeout(function(){i.disableFormElements(s)},13)}),t(document).delegate(i.formInputClickSelector,"click.rails",function(e){var n=t(this);if(!i.allowAction(n))return i.stopEverything(e);var s=n.attr("name"),o=s?{name:s,value:n.val()}:null;n.closest("form").data("ujs:submit-button",o)}),t(document).delegate(i.formSubmitSelector,"ajax:beforeSend.rails",function(e){this==e.target&&i.disableFormElements(t(this))}),t(document).delegate(i.formSubmitSelector,"ajax:complete.rails",function(e){this==e.target&&i.enableFormElements(t(this))}),t(function(){var e=t("meta[name=csrf-token]").attr("content"),i=t("meta[name=csrf-param]").attr("content");t('form input[name="'+i+'"]').val(e)}))}(jQuery);