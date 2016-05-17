<!--<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style class="cp-pen-styles">
::-moz-selection {
 background: white;
}
::selection { background: white; }
 @-webkit-keyframes 
icon-beat {  0% {
 -webkit-transform: scale(2);
 -ms-transform: scale(2);
 transform: scale(2);
}
 100% {
 -webkit-transform: scale(1);
 -ms-transform: scale(1);
 transform: scale(1);
}
}
 @keyframes 
icon-beat {  0% {
 -webkit-transform: scale(2);
 -ms-transform: scale(2);
 transform: scale(2);
}
 100% {
 -webkit-transform: scale(1);
 -ms-transform: scale(1);
 transform: scale(1);
}
}

label {
  display: block;
  position: relative;
  padding: 0.5rem 1rem;
  line-height: 28px;
  font-weight: normal;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
}

label:last-of-type { margin-right: 1rem; }

label i {
  display: inline-block;
  height: 25px;
  position: relative;
  top: 6px;
  font-style: normal;
  color: #ccc;
}

label span {
  display: inline-block;
  margin-left: 5px;
  line-height: 25px;
  color: gray;
}

input[type="checkbox"] { display: none; }

input[type="checkbox"] + i:before {
  font-family: 'FontAwesome';
  font-size: 28px;
  height: 25px;
  width: 25px;
  display: inline-block;
}

input[type="checkbox"]:checked + i {
  position: relative;
  -webkit-animation: icon-beat 0.1s ease;
  animation: icon-beat 0.1s ease;
}

input[type="checkbox"]:checked + i + span {
  -webkit-transition: all 0.1s ease;
  transition: all 0.1s ease;
}

input[type="checkbox"] + i:before { content: "\f096"; }

input[type="checkbox"]:checked + i:before { content: "\f046"; }

input[type="checkbox"]:checked + i + span,
input[type="checkbox"]:checked + i:before { color: rgba(0, 128, 0, 0.5); }

.form-vertical {
  padding: 2rem;
  margin: 1rem;
  float: left;
  clear: both;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.25);
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.25);
}



.form-vertical label {
  float: none;
  padding-left: 0;
}

.form-vertical label:first-of-type { padding-top: 1rem; }
</style>
-->


<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
/*$('#button-filter').on('click', function() {
	*/
$('#button-filter').on('click', function() {
  filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
