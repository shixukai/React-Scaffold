import actionTypes from '__src_dir__/constants';
import { objectToFormData, toQueryString } from '__src_dir__/Utils/Utils';

export function searchAll(args = {}) {
  return ({
    types: [actionTypes.CONST_TEMP_REQUEST, actionTypes.CONST_TEMP_SUCCESS, actionTypes.CONST_TEMP_FAILED],
    endPoint: isEmptyObj(args.params)  ? '/__EndPoint__' : `/__EndPoint__?${ toQueryString(args.params) }`,
    fetchInit: { method: 'GET' },
    // fetchInit: { method: 'GET', body: objectToFormData(params) },
  });
}
