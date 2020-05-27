<footer>

</footer>

<!-- Required script -->
<script type="text/javascript" src="/<?php echo __js_directory__; ?>/Module/jquery-1.10.min.js"></script>
<script type="text/javascript" src="/<?php echo __js_directory__; ?>/Module/materialize.min.js"></script>
<script type="text/javascript" src="/<?php echo __js_directory__; ?>/_built.js"></script>
<script>
	var modal = null;
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('.sidenav');
		var instances = M.Sidenav.init(elems, {});

		var elems1 = document.querySelectorAll('.modal');
		var instances1 = M.Modal.init(elems1, {});

		modal = instances1;
	});
</script>
<?php
if(isset($this->Sections['scripts']))
	$this->render($this->Sections['scripts']);
?>