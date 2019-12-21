

  <div class="col s12 m6 l4 z-depth-4 card-panel border-radius-6 login-card bg-opacity-8">
     <?php if(isset($_GET['redirect'])) : ?>
        <?php echo form_open(site_url("hideend/login/pro/" . urlencode($_GET['redirect']))) ?>
        <?php else : ?>
        <?php echo form_open(site_url("hideend/login/pro")) ?>
        <?php endif; ?>
      <div class="row">
        <div class="input-field col s12">
          <h5 class="ml-4">Sign in</h5>
        </div>
      </div>
      <div class="row margin">
        <div class="input-field col s12">
          <i class="material-icons prefix pt-2">person_outline</i>
          <input id="username" type="text" name="email">
          <label for="username" class="center-align">Username</label>
        </div>
      </div>
      <div class="row margin">
        <div class="input-field col s12">
          <i class="material-icons prefix pt-2">lock_outline</i>
          <input id="password" type="password" name="pass">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
         
          <button type="submit" class="btn waves-effect waves-light border-round gradient-45deg-purple-deep-orange col s12">Login</button>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6 m6 l6">
          <p class="margin medium-small"><a href="<?php echo site_url("hideend/register") ?>">Register New!</a></p>
        </div>
        <div class="input-field col s6 m6 l6">
          <p class="margin right-align medium-small"><a href="<?php echo site_url("hideend/login/forgotpw") ?>">Forgot password ?</a></p>
        </div>
      </div>
     <?php echo form_close() ?>
  </div>
</div>