import { connect } from "react-redux";
import ItemDetail from "./item_detail";
import { selectPokemonItem } from '../../reducers/selector';

const mapStateToProps = (state, ownProps) => {
//   debugger;
    const item = selectPokemonItem(state, ownProps.match.params.itemId)
    return {
      item
    };
};

export default connect(mapStateToProps)(ItemDetail);
