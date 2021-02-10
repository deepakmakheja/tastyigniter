<div id="local-box">
    <div class="panel local-search">
        <div class="panel-body">
            <div class="row">
                <?php if(!$hideSearch): ?>
                    <div class="col-sm-12">
                        <?php echo controller()->renderPartial('@searchbar'); ?>
                    </div>
                <?php endif; ?>
            </div>
            <?php if($location->requiresUserPosition()
                AND $location->userPosition()->hasCoordinates()
                AND !$location->checkDeliveryCoverage()): ?>
                <span class="help-block"><?php echo app('translator')->get('igniter.local::default.text_delivery_coverage'); ?></span>
            <?php endif; ?>
        </div>
    </div>

    <?php echo controller()->renderPartial($__SELF__.'::default'); ?>

    <div class="card mt-1 d-block d-sm-none">
        <div class="card-body">
            <div class="local-timeslot mb-3">
                <?php echo controller()->renderPartial('@timeslot'); ?>
            </div>
            <div class="local-control">
                <?php echo controller()->renderPartial('@control'); ?>
            </div>
        </div>
    </div>
</div>

