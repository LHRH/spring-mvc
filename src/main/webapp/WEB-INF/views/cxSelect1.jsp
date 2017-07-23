<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linghu
  Date: 17/04/09
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctp" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>cxSelect 联动下拉菜单 &raquo; 在线演示 - 前端开发仓库</title>
    <style>
        body {
            background: #ddd;
            font: 14px/1.7 tahoma, '\5fae\8f6f\96c5\9ed1', sans-serif;
        }

        h1, h2, h3 {
            font-size: 36px;
            line-height: 1;
        }

        h2 {
            font-size: 24px;
        }

        h3 {
            font-size: 18px;
        }

        fieldset {
            margin: 2em 0;
        }

        fieldset legend {
            font-weight: bold;
            font-size: 16px;
            line-height: 2;
        }

        select, button {
            padding: 0.5em;
        }

        a {
            color: #06f;
            text-decoration: none;
        }

        a:hover {
            color: #00f;
        }

        .wrap {
            width: 900px;
            margin: 0 auto;
            padding: 20px 50px;
            border-radius: 8px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
    </style>
    <script src="http://cdn.staticfile.org/jquery/1.11.3/jquery.min.js"></script>
    <!-- <script src="http://cdn.staticfile.org/zepto/1.0/zepto.min.js"></script> -->
    <script src="${ctp}/static/assets/cxselect/js/jquery.cxselect.js"></script>
</head>
<body>
<div class="wrap">
    <h1>cxSelect 联动下拉菜单</h1>

    <h2>示例</h2>
    <p>如果无法通过 AJAX 获取数据，请运行在服务器环境下。</p>

    <fieldset id="city_china">
        <legend>默认</legend>
        <p>省份：<select class="province other">
            <option>请选择</option>
        </select></p>
        <p>城市：<select class="city">
            <option>请选择</option>
        </select></p>
        <p>地区：<select class="area">
            <option>请选择</option>
        </select></p>
    </fieldset>

    <fieldset id="city_china_val">
        <legend>设置默认值及选项标题</legend>
        <p>所在地区：
            <select class="province other" data-first-title="选择省">
                <option value="">请选择</option>
                <option value="浙江省" selected>浙江省</option>
            </select>
            <select class="city" data-first-title="选择市">
                <option value="">请选择</option>
                <option value="杭州市" selected>杭州市</option>
            </select>
            <select class="area" data-first-title="选择地区">
                <option value="">请选择</option>
                <option value="西湖区" selected>西湖区</option>
            </select>
        </p>
    </fieldset>

    <!-- <fieldset id="city_china_val">
      <legend>多种设置默认值的方式</legend>

      <p>方法一：使用 option 的 value 和 selected 属性</p>
      <p><select class="province">
        <option>浙江省</option>
      </select></p>

      <p>如果有多个 option ，需要使用 selected 属性指定选中项</p>
      <p><select class="city">
        <option>请选择</option>
        <option value="杭州市" selected>杭州市</option>
      </select></p>

      <p>方法二：使用 select 的 data-value 属性</p>
      <p><select class="area" data-value="西湖区">
        <option>请选择</option>
      </select></p>
    </fieldset> -->

    <fieldset id="global_location">
        <legend>全球主要国家城市联动</legend>
        <p>所在地区：
            <select class="country" data-first-title="选择国家"></select>
            <select class="state" data-required="true"></select>
            <select class="city" data-required="true"></select>
            <select class="region" data-required="true"></select>
        </p>
    </fieldset>

    <fieldset id="custom_data">
        <legend>自定义选项</legend>
        <p>一：<select class="first"></select></p>
        <p>二：<select class="second"></select></p>
        <p>三：<select class="third"></select></p>
        <p>四：<select class="fourth"></select></p>
        <p>五：<select class="fifth"></select></p>
    </fieldset>

    <fieldset>
        <legend>API 接口</legend>
        <div id="api_data">
            <dl>
                <dt>选择器组 A</dt>
                <dd>
                    <select class="province select"></select>
                    <select class="city select"></select>
                    <select class="area select"></select>
                </dd>
            </dl>
            <dl>
                <dt>选择器组 B</dt>
                <dd>
                    <select class="first select"></select>
                    <select class="second select"></select>
                    <select class="third select"></select>
                    <select class="fourth select"></select>
                    <select class="fifth select"></select>
                </dd>
            </dl>
        </div>

        <p>
            <button type="button" class="button green" name="attach" value="">attach</button>
            <button type="button" class="button green" name="detach" value="">detach</button>
            <button type="button" class="button green" name="clear" value="">clear</button>
        </p>
        <p>
            <button type="button" class="button green" name="setSelect" value="b">更换 select 组</button>
            <button type="button" class="button green" name="setData" value="china">更换数据：国内数据</button>
            <button type="button" class="button green" name="setData" value="global">更换数据：全球数据</button>
            <button type="button" class="button green" name="setData" value="custom">更换数据：自定义数据</button>
        </p>
        <p>
            <button type="button" class="button green" name="required" value="0">更改 required</button>
            <button type="button" class="button green" name="emptyStyle" value="">更改 emptyStyle</button>
            <button type="button" class="button green" name="firstTitle" value="请选择">更改 firstTitle</button>
        </p>
    </fieldset>

    <h2>文档</h2>
    <ul>
        <li><a target="_blank" href="https://github.com/ciaoca/cxSelect">Github</a></li>
        <li><a target="_blank" href="http://code.ciaoca.com/jquery/cxSelect/">中文文档</a></li>
    </ul>

    <h2>作者</h2>
    <p><a target="_blank" href="http://ciaoca.com/">http://ciaoca.com/</a></p>
    <p>Released under the MIT license</p>
</div>
<script>
    (function () {
        var urlChina = '${ctp}/static/assets/cxselect/js/cityData.min.json';
        var urlGlobal = '${ctp}/static/assets/cxselect/js/globalData.min.json';
        var dataCustom = [
            {
                'v': '1', 'n': '第一级 >', 's': [
                {
                    'v': '2', 'n': '第二级 >', 's': [
                    {
                        'v': '3', 'n': '第三级 >', 's': [
                        {
                            'v': '4', 'n': '第四级 >', 's': [
                            {
                                'v': '5', 'n': '第五级 >', 's': [
                                {'v': '6', 'n': '第六级 >'}
                            ]
                            }
                        ]
                        }
                    ]
                    }
                ]
                },
                {
                    'v': '2', 'n': '第二级1 >', 's': [
                    {
                        'v': '3', 'n': '第三级 >', 's': [
                        {
                            'v': '4', 'n': '第四级 >', 's': [
                            {
                                'v': '5', 'n': '第五级 >', 's': [
                                {'v': '6', 'n': '第六级 >'}
                            ]
                            }
                        ]
                        }
                    ]
                    }
                ]
                },
                {
                    'v': '2', 'n': '第二级2 >', 's': [
                    {
                        'v': '3', 'n': '第三级 >', 's': [
                        {
                            'v': '4', 'n': '第四级 >', 's': [
                            {
                                'v': '5', 'n': '第五级 >', 's': [
                                {'v': '6', 'n': '第六级 >'}
                            ]
                            }
                        ]
                        }
                    ]
                    }
                ]
                }
            ]
            },
            {
                'v': 'test number', 'n': '测试数字', 's': [
                {
                    'v': 'text', 'n': '文本类型', 's': [
                    {'v': '4', 'n': '4'},
                    {'v': '5', 'n': '5'},
                    {'v': '6', 'n': '6'},
                    {'v': '7', 'n': '7'},
                    {'v': '8', 'n': '8'},
                    {'v': '9', 'n': '9'},
                    {'v': '10', 'n': '10'}
                ]
                },
                {
                    'v': 'number', 'n': '数值类型', 's': [
                    {'v': 11, 'n': 11},
                    {'v': 12, 'n': 12},
                    {'v': 13, 'n': 13},
                    {'v': 14, 'n': 14},
                    {'v': 15, 'n': 15},
                    {'v': 16, 'n': 16},
                    {'v': 17, 'n': 17}
                ]
                }
            ]
            },
            {
                'v': 'test boolean', 'n': '测试 Boolean 类型', 's': [
                {'v': true, 'n': true},
                {'v': false, 'n': false}
            ]
            },
            {
                v: 'test quotes', n: '测试属性不加引号', s: [
                {v: 'quotes', n: '引号'}
            ]
            },
            {
                v: 'test other', n: '测试奇怪的值', s: [
                {v: '[]', n: '数组（空）'},
                {v: [1, 2, 3], n: '数组（数值）'},
                {v: ['a', 'b', 'c'], n: '数组（文字）'},
                {v: new Date(), n: '日期'},
                {v: new RegExp('\\d+'), n: '正则对象'},
                {v: /\d+/, n: '正则直接量'},
                {v: {}, n: '对象'},
                {v: document.getElementById('custom_data'), n: 'DOM'},
                {v: null, n: 'Null'},
                {n: '未设置 value'}
            ]
            },
            {'v': '', 'n': '无子级'}
        ];

        $.cxSelect.defaults.url = urlChina;

        // 默认
        $('#city_china').cxSelect({
            selects: ['province', 'city', 'area']
        });

        // 设置默认值及选项标题
        $('#city_china_val').cxSelect({
            selects: ['province', 'city', 'area'],
            emptyStyle: 'none'
        });

        // 全球主要国家城市联动
        $('#global_location').cxSelect({
            url: urlGlobal,
            selects: ['country', 'state', 'city', 'region'],
            emptyStyle: 'none'
        });

        $.ajax({
            url: "${ctp}/test/ajaxCxSelect1",
            success: function (d) {
                debugger
                // 自定义选项
                $('#custom_data').cxSelect({
                    selects: ['first', 'second', 'third', 'fourth', 'fifth'],
                    // required: true,
                    jsonValue: 'v',
                    data: dataCustom
                });
            }
        })


        // API 接口
        var apiBox = $('#api_data');
        var cxSelectApi;

        apiBox.cxSelect({
            selects: ['province', 'city', 'area']
        }, function (api) {
            cxSelectApi = api;
        });

        // cxSelectApi = $.cxSelect(apiBox, {
        //   selects: ['province', 'city', 'area']
        // });

        $('body').on('click', 'button', function () {
            var _name = this.name;
            var _value = this.value;

            switch (_name) {
                case 'attach':
                    cxSelectApi.attach();
                    break;

                case 'detach':
                    cxSelectApi.detach();
                    break;

                case 'clear':
                    cxSelectApi.clear();
                    break;

                case 'required':
                    cxSelectApi.setOptions({
                        required: _value == 1 ? false : true
                    });
                    this.value = _value == 1 ? 0 : 1;
                    break;

                case 'emptyStyle':
                    if (_value === 'none') {
                        _value = 'hidden';
                    } else if (_value === 'hidden') {
                        _value = '';
                    } else {
                        _value = 'none';
                    }
                    ;
                    cxSelectApi.setOptions({
                        emptyStyle: _value
                    });
                    this.value = _value;
                    break;

                case 'firstTitle':
                    _value = _value === '请选择' ? '选择吧' : '请选择';
                    cxSelectApi.setOptions({
                        firstTitle: _value
                    });
                    this.value = _value;
                    break;

                case 'setSelect':
                    cxSelectApi.setOptions({
                        selects: _value === 'a' ? ['province', 'city', 'area'] : ['first', 'second', 'third', 'fourth', 'fifth']
                    });
                    this.value = _value === 'a' ? 'b' : 'a';
                    break;

                case 'setData':
                    if (_value === 'china' || _value === 'global') {
                        // $.ajax({
                        //   url: this.value === 'china' ? urlChina : urlGlobal,
                        //   type: 'GET',
                        //   dataType: 'json'
                        // }).done(function(data, textStatus, jqXHR) {
                        cxSelectApi.setOptions({
                            url: this.value === 'china' ? urlChina : urlGlobal,
                            // data: data
                        });
                        // }).fail(function(jqXHR, textStatus, errorThrown) {
                        // });

                    } else if (this.value === 'custom') {
                        cxSelectApi.setOptions({
                            data: dataCustom
                        });
                    }
                    ;
                    break;

                // not default
            }
            ;
        });
    })();
</script>
</body>
</html>
