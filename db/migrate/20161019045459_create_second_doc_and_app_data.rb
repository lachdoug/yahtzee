class CreateSecondDocAndAppData < ActiveRecord::Migration[5.0]

  def up
    Page.delete_all
    Page.create!([
      {chapter_id: Chapter.find_by(name: "Tools").id, preface: "", name: "Browser inspector", order: 1},
      {chapter_id: Chapter.find_by(name: "Tools").id, preface: "", name: "Manipulate elements", order: 2},
      {chapter_id: Chapter.find_by(name: "Tools").id, preface: "", name: "Browser console", order: 3},
      {chapter_id: Chapter.find_by(name: "Tools").id, preface: "", name: "Network activity", order: 4},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "HTML", order: 1},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "Styling", order: 2},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "Style definitions", order: 3},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "Style sheets", order: 4},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "Images", order: 5},
      {chapter_id: Chapter.find_by(name: "HTML/CSS").id, preface: "", name: "Fonts and icons", order: 6},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Variables and logic", order: 1},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Data types", order: 2},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Strings", order: 3},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Arrays", order: 4},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Functions", order: 5},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Objects", order: 6},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "JSON", order: 7},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "Standard library", order: 8},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "DOM", order: 9},
      {chapter_id: Chapter.find_by(name: "Javascript").id, preface: "", name: "JQuery", order: 10},
      {chapter_id: Chapter.find_by(name: "Web").id, preface: "", name: "Requests and responses", order: 1}
    ])
    Section.delete_all
    Section.create!([
      {page_id: Page.find_by(name: "Browser inspector").id, name: nil, body: "###1\r\n\r\nGo to the school web page [DHSVAD](http://www.dulwich-h.schools.nsw.edu.au/).\r\n\r\n###2\r\n\r\nOpen browser inspector.\r\n\r\n*   [Firefox](https://developer.mozilla.org/en/docs/Tools/Page_Inspector)\r\n*   [Explorer](https://developer.microsoft.com/en-us/microsoft-edge/platform/documentation/f12-devtools-guide/)\r\n*   [Safari](https://developer.apple.com/library/mac/documentation/AppleApplications/Conceptual/Safari_Developer_Guide/GettingStarted/GettingStarted.html)\r\n*   [Chrome](https://developer.chrome.com/devtools)\r\n\r\n", order: 1},
      {page_id: Page.find_by(name: "Manipulate elements").id, name: nil, body: "### 1\r\n\r\n`<!DOCTYPE html>`\r\n\r\n### 2\r\n\r\nMinimum HTML5 document\r\n\r\n```\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n  <meta charset=\"utf-8\"/>\r\n  <title>Empty document</title>\r\n</head>\r\n\r\n<body>\r\n  This is where page content goes.\r\n</body>\r\n\r\n</html>\r\n```\r\n\r\n### 3\r\n\r\nHTML element:\r\n\r\n```\r\n<tag attribute=\"value\">\r\n  some content...\r\n</tag>\r\n```\r\n\r\n### 4\r\n\r\nDocument: `html`, `head`, `title`, `link`, `style`, `script`\r\n\r\nSections: `body`, `h1 - h6`\r\n\r\nGroups: `p`, `br`, `div`\r\n\r\nText: `a`, `strong`, `small`, `i`, `span`\r\n\r\nEmbeded: `img`\r\n\r\nForms: `form, input, button`\r\n\r\n[W3 HTML language reference](https://www.w3.org/TR/html-markup/elements-by-function.html#elements-by-function)\r\n\r\n### 5\r\n\r\nAttributes: `id`, `class`, `style`, `title`\r\n\r\n```\r\n<div id=\"message_1\" class=\"message\">\r\n  ...\r\n</div>\r\n```\r\n\r\n### 6\r\n\r\nComments\r\n\r\n```\r\n<!--  This is a comment. -->\r\n```\r\n", order: nil},
      {page_id: Page.find_by(name: "Browser console").id, name: nil, body: "### 1\r\n\r\nFind `<div id=\"screen\" class=\"bg-primary\">`. Hint: it's a child node of `<body>`.\r\n\r\nFind the rule for `#screen`.\r\n\r\nChange its `background-color` style. Try the color palete. Try manually entering colour values `#00F`, `white`, `transparent`.\r\n\r\n### 2\r\n\r\nRicht click on school name and select 'inspect'.\r\n\r\nRight click on the `<a>` node and select 'Edit as HTML'.\r\n\r\nEdit school name text.\r\n\r\nChange `font-size` to 24px.\r\n\r\nChange `margin-top` to 12px.\r\n\r\nDeselect `text-transform`.\r\n\r\n### 3\r\n\r\nHave a play with the document.\r\n\r\nChange some text and colours. Delete some nodes.\r\n\r\nReload the page when you're done.", order: 1},
      {page_id: Page.find_by(name: "Network activity").id, name: nil, body: "###1\r\n\r\nGo to Network Monitor in the Inspector.\r\n\r\nReload the page and note the downloaded files.\r\n\r\n###2\r\n\r\nEnter:\r\n\r\n```\r\n$.get(\"index.html\");\r\n```\r\n\r\nEnter:\r\n\r\n```\r\nlocation = \"http://abc.net.au\";\r\n```", order: nil},
      {page_id: Page.find_by(name: "HTML").id, name: nil, body: "Execute Javascript.\r\n\r\n### 1\r\n\r\nSome commands to try:\r\n\r\n```\r\n1+1;  \r\n\"Hi\";  \r\nDate();  \r\nalert(\"Hi, right now it's \" + Date());\r\n```\r\n\r\n### 2\r\n\r\nManipulate the document.\r\n\r\n\r\n```\r\n$(\"#screen\").html(\"<h1>New content</h1>\");\r\n$(\"#screen\").css({\"font-size\": \"2em\", \"color\": \"#666\", \"background-color\": \"#48d\", \"padding\": \"50px\"});</pre>\r\n```\r\n\r\n### 3\r\n\r\nAccess command history with up arrow.\r\n\r\nEdit the previous command. Change the `color` property:\r\n\r\n```\r\n$(\"#screen\").css({\"font-size\": \"2em\", \"color\": \"#fff\", \"background-color\": \"#48d\", \"padding\": \"50px\"});\r\n```\r\n\r\n### 4\r\n\r\nReload the page.\r\n\r\n```\r\nlocation.reload();\r\n```", order: 1},
      {page_id: Page.find_by(name: "Styling").id, name: nil, body: "### 1\r\n\r\n`font-size: 16px`  \r\n`color: #ccc;`  \r\n`background-color: #48d;`  \r\n\r\n`height: 24px;`  \r\n`max-height: 100px;`\r\n\r\n`margin: 5px;`  \r\n\r\n`padding: 5px;`  \r\n`padding: 0px 10px;`  \r\n`padding-left: 10px;`\r\n\r\n`overflow-y: scroll;`  \r\n`word-wrap: break-word;`\r\n\r\n`display: inline-block;`  \r\n`vertical-align: top;`\r\n\r\n`cursor: pointer;`\r\n\r\n[MDN CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)\r\n\r\n### 2\r\n\r\nTry exercise App 1", order: nil},
      {page_id: Page.find_by(name: "Style definitions").id, name: nil, body: "### 1\r\n\r\nStyles can be defined and applied using selectors.\r\n\r\nCommon selectors:\r\n\r\n*   Tag name - no prefix\r\n*   Class - '.' prefix\r\n*   ID - '#' prefix\r\n\r\n### 2\r\n\r\nLet's remove the in-line styling and use style definitions instead.\r\n\r\nAdd a `<style></style>` element:\r\n\r\n```\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n  <meta charset=\"utf-8\"/>\r\n  <title>Flatchat</title>\r\n</head>\r\n\r\n<style>\r\nbody {\r\n  font-family: arial, sans-serif; }\r\n\r\n#logo {\r\n  font-size: 1.5em;\r\n  color: #48d; }\r\n\r\n#rooms_panel {\r\n  background-color: #48d;\r\n  color: #fff;\r\n  padding: 10px;\r\n  margin-top: 5px; }\r\n\r\n#messages_panel {\r\n  background-color: #48d;\r\n  color: #fff;\r\n  padding: 10px;\r\n  margin-top: 5px; }\r\n</style>\r\n\r\n<body>\r\n  <div id=\"logo\">Flatchat</div>\r\n  <div id=\"rooms_panel\">Rooms</div>\r\n  <div id=\"messages_panel\">Messages</div>\r\n</body>\r\n\r\n</html>\r\n```\r\n\r\nNotice that the app title element has changed from an `h1` tag to `<div id=\"logo\">`. The title is now being styled by the `#logo` style definition.", order: nil},
      {page_id: Page.find_by(name: "Style sheets").id, name: nil, body: "### 1\r\n\r\nIt can be easier to manage your style definitions when they are in a separate file. Let's move our style definitions from the `<style></style>` element to a css file.\r\n\r\n### 2\r\n\r\nDelete the `<style></style>` element.\r\n\r\n### 3\r\n\r\nCreate a new file 'styles/application.css'\r\n\r\n```\r\nbody { font-family: arial, sans-serif; color: #48d; word-wrap: break-word; }\r\n#logo { font-size: 1.5em; }\r\n#logo img { vertical-align: middle; margin-top: -3px; height: 24px; }\r\n#rooms_panel { padding: 10px; margin-top: 5px; }\r\n.room { padding: 5px; }\r\n.room:hover { background-color: #eee; cursor: pointer; }\r\n#messages_panel { padding: 10px; margin-top: 5px; }\r\n#selected_room_name { padding: 5px; font-size: 1.2em; }\r\n.message { padding: 5px; }\r\n.username, .time_ago { display: inline-block; color: #999; }\r\n.username { font-weight: 700; }\r\n.time_ago { font-size: 0.8em; }\r\n.message_body { font-family: 'Chewy', cursive; font-size: 1.5em; }\r\ninput { width: 100%; }\r\n@media (max-width: 767px) {\r\n  .rooms {\r\n    max-height: 100px;\r\n    overflow-y: scroll;\r\n  }\r\n}\r\n@media (min-width: 768px) {\r\n  #rooms_panel {\r\n    display: inline-block;\r\n    vertical-align: top;\r\n    width: 20%;\r\n  }\r\n  #messages_panel {\r\n    display: inline-block;\r\n    vertical-align: top;\r\n    width: 70%;\r\n  }\r\n}\r\n```\r\n\r\nNotice that there are some new selectors that don't refer to tags in our 'index.html'. We'll create new html in a moment that will use them.\r\n\r\n### 4\r\n\r\nInclude the css in 'index.html' by adding a link to the bottom of the `<head>` tag.\r\n\r\n```\r\n<link rel=\"stylesheet\" href=\"styles/application.css\">\r\n```\r\n\r\n### 5\r\n\r\nYou may have some of your own style definitions that you would like to apply. Create another css file and put your personal style definitions in there.\r\n\r\nCall your new css file 'theme.css', then include it with another link at the bottom of the `<head>` tag.\r\n\r\nBe sure to put this link after the link to 'application.css'. That way your styles will be applied after the 'application.css' styles.\r\n\r\n```\r\n<link rel=\"stylesheet\" href=\"styles/theme.css\">\r\n```\r\n\r\n### 6\r\n\r\nComments\r\n\r\n```\r\n//  This is a CSS comment.\r\n```", order: nil},
      {page_id: Page.find_by(name: "Images").id, name: nil, body: "### 1\r\n\r\nSave the [Flatchat logo](client_logo.png) to 'flatchat/logo.png'.\r\n\r\n### 2\r\n\r\nChange the `<div id=\"logo\">` element to:\r\n\r\n```\r\n<div id=\"logo\">\r\n  <img src=\"logo.png\"></img>\r\n  Flatchat\r\n</div>\r\n```\r\n\r\nReload the page.\r\n\r\nAdd to css file:\r\n\r\n```\r\n#logo img { vertical-align: middle; margin-top: -3px; height: 24px; }\r\n```\r\n\r\nReload the page.\r\n\r\n### 3\r\n\r\nAdd to `<head>` (put it above the link to 'application.css'):\r\n\r\n```\r\n<link rel=\"shortcut icon\" href=\"logo.png\">\r\n```\r\n\r\nReload the page. To get the browser to load the icon you may need to open file and reopen tab.", order: nil},
      {page_id: Page.find_by(name: "Fonts and icons").id, name: nil, body: "### 1\r\n\r\n[Google Fonts - Chewy](https://fonts.google.com/specimen/Chewy?query=chewy)\r\n\r\n### 2\r\n\r\nAdd to `<head>`, above the 'application.css' link:\r\n\r\n```\r\n<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Chewy\">\r\n```\r\n\r\n### 3\r\n\r\nAdd to 'application.css':\r\n\r\n```\r\n.message_body { font-family: 'Chewy', cursive; font-size: 1.5em; }\r\n```\r\n\r\n### 4\r\n\r\nPopular icon libraries include:\r\n\r\n*   [Font Awesome](http://fontawesome.io)\r\n*   [Google icons](https://design.google.com/icons/)\r\n\r\n### 5\r\n\r\nWe will use Font Awesome. Add to `<head>`, above the 'application.css' link:\r\n\r\n```\r\n<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css\">\r\n```\r\n\r\n### 6\r\n\r\nUse `<i>` tags to create icon elements.\r\n\r\n`<i class=\"fa fa-comment-o\"></i>` for\r\n\r\n`<i class=\"fa fa-comments-o\"></i>` for .\r\n\r\n### 7\r\n\r\nAdd `<i class=\"fa fa-comment-o\"></i>` to each `<div class=\"message_body\">`:\r\n\r\n```\r\n<div class=\"room_name\"><i class=\"fa fa-comment-o\"></i> Is this data from the server?</div>\r\n```\r\n\r\nAdd `<i class=\"fa fa-comments-o\"></i>` to each `<div class=\"room_name\">`:\r\n\r\n```\r\n<div class=\"room_name\"><i class=\"fa fa-comments-o\"></i> Working yet?</div>\r\n```", order: nil},
      {page_id: Page.find_by(name: "Variables and logic").id, name: nil, body: "### 1\r\n\r\nDeclare variables with `var`.\r\n\r\n### 2\r\n\r\nTry these commands in your console.\r\n\r\n```\r\nvar x = 1;\r\nx + x;\r\n```\r\n\r\n### 3\r\n\r\nUndeclared variables are global.\r\n\r\n```\r\nx = 1;\r\nx + x;\r\n```\r\n\r\n### 4\r\n\r\nLogical operators\r\n\r\n*   `x == y` x is equal to y?\r\n*   `x > y` x is greater than y?\r\n*   `x >= y` x is greater than or equal to y?\r\n\r\n```\r\n1 == 1;\r\n1 == 2;\r\n1 > 2;\r\n1 < 2;\r\n2 <= 2;\r\n```\r\n\r\n### 5\r\n\r\nComparison operators\r\n\r\n```\r\ntrue && false;\r\ntrue || false;\r\n1 == 2 || 2==2;\r\n```\r\n\r\n### 6\r\n\r\nIf statement\r\n\r\n```\r\nif ( true ) { \"green\" };\r\nif ( false ) { \"green\" };\r\nif ( false ) { \"green\" } else { \"red\" };\r\nif ( 100 > 99 ) { \"green\" } else { \"red\" };\r\nif ( 100 < 99 ) { \"green\" } else { \"red\" };\r\n```\r\n\r\n### 7\r\n\r\nSemicolons\r\n\r\n```\r\nvar x = 2;\r\nx + x;\r\nvar x = 2\r\nx + x\r\nvar x = 2; x + x;\r\nvar x = 2 x + x\r\n```\r\n\r\n### 8\r\n\r\nComments\r\n\r\n```\r\n//  This is a comment.\r\n```\r\n\r\n", order: nil},
      {page_id: Page.find_by(name: "Data types").id, name: nil, body: "<h3>1</h3>\r\n<p><table>\r\n  <tr><th>Data type</th><th></th><th>typeof</th></tr>\r\n  <tr><td>Number</td><td>42</td><td>number</td></tr>\r\n  <tr><td>String</td><td>\"Hi\"</td><td>string</td></tr>\r\n  <tr><td>Boolean</td><td>true</td><td>boolean</td></tr>\r\n  <tr><td>Function</td><td>Date</td><td>function</td></tr>\r\n  <tr><td>Object</td><td>document</td><td>object</td></tr>\r\n  <tr><td>Null</td><td>null</td><td>object</td></tr>\r\n  <tr><td>Undefined</td><td>n/a</td><td>undefined</td></tr>\r\n</table></p>\r\n\r\n<h3>2</h3>\r\n<pre>\r\ntypeof(42);\r\ntypeof(\"Hi\");\r\ntypeof(true);\r\ntypeof(Date);\r\ntypeof(document);\r\ntypeof(fairy);\r\n</pre>\r\n\r\n<h3>3</h3>\r\n<p>Nothingness</p>\r\n<ul>\r\n  <li><code>Undefined</code> I don't know what you're talking about.</li>\r\n  <li><code>Null</code> I know what you're asking, but I don't have an answer for you.</li>\r\n  <li><code>0</code> Number 0.</li>\r\n  <li><code>\"\"</code> Empty string.</li>\r\n  <li><code>false</code> No/off/negative.</li>\r\n</ul>", order: nil}
    ])
  end

  def down

  end

end