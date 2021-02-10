<div id="local-box" class="local-box-fluid">
    <div class="panel panel-local local-search">
        <div class="panel-body">
            <h2 class="text-center text-primary"><?php echo app('translator')->get('igniter.local::default.text_order_summary'); ?></h2>
            <span class="search-label sr-only"><?php echo app('translator')->get('igniter.local::default.label_search_query'); ?></span>
            <?php if($hideSearch): ?>
                <a
                    class="btn btn-block btn-primary"
                    href="<?php echo e(restaurant_url($menusPage)); ?>"><?php echo app('translator')->get('igniter.local::default.text_find'); ?></a>
            <?php else: ?>
                <?php echo controller()->renderPartial('@form'); ?>
            <?php endif; ?>
        </div>
    </div>
</div>

