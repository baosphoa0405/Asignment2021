<div
    class="modal fade"
    id="loginModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
    >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close"
                    >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="MainController" method="POST">
                    <div class="form-group first">
                        <label for="email">Username</label>
                        <input type="text" class="form-control" id="email" name="email" />
                    </div>
                    <div class="form-group last mb-4">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" />
                    </div>
                    <div class="d-flex mb-5 align-items-center">
                        <label class="control control--checkbox mb-0"
                               ><span class="caption">Remember me</span>
                            <input type="checkbox" checked="checked" />
                            <div class="control__indicator"></div>
                        </label>
                        <span class="ml-auto"
                              ><a href="#" class="forgot-pass">Forgot Password</a></span
                        >
                    </div>
                    <input
                        type="submit"
                        name="BtnAction"
                        value="LogIn"
                        class="btn btn-pill text-white btn-block btn-primary"
                        />
                </form>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal"
                    >
                    Close
                </button>

            </div>
        </div>
    </div>
</div>