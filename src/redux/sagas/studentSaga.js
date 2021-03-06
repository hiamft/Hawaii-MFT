import axios from "axios";
import { put, takeLatest } from "redux-saga/effects";

// will be fired on "FETCH_PROFILE" actions
//initiates GET request when profile views load
function* setStudent(action) {
  try {
    yield axios.put(`/profile/student`, action.payload);
    yield put({ type: 'FETCH_PROFILE', payload: action.payload});
    

    } catch (error) {
        console.log('Error in sending members info to the server', error);
    }
}

function* studentSaga() {
  yield takeLatest("STUDENT", setStudent);
}

export default studentSaga;
