
test


<p>Add Vote</p>
<input type="text" id="vote" />
<button id="addVote">Vote</button>


<script type="application/javascript">
    $('#addVote').click(function () {
        console.log('here');
        AddVote($('#vote').val());
    });
</script>