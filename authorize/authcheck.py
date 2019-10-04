def authentication(auth,role_id,user_role_id):
    if auth is True:
        if role_id == user_role_id:
            return True
        else :
            return False,"Invalid_User"

    else:
        return False,"not_login"