//holds all the profile details for one specific user

const profileReducer = (state = {}, action) => {
    if (action.type === 'GET_PROFILE_REDUCER') {
        return action.payload[0];
    } else if (action.type === 'PROFILE_RESET') {
        return {}
    } else {
     return state;
    }
};

export default profileReducer;
