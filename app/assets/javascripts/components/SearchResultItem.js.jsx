class SearchResultItem extends React.Component{

    constructor(props){
        super(props);
    }

    render(){
        return(<tr>
            <td align="center">
                <a className="btn btn-default btn-edit" href={this.props.edit_action}>
                    <em className="fa fa-pencil"/>
                </a>
                <a data-confirm="Are you sure?" className="btn btn-danger btn-dlt" rel="nofollow" data-method="delete" href={this.props.show_action}>
                    <em className="fa fa-trash"/>
                </a>
            </td>
            <td className="hidden-xs">
                {this.props.item_id}
            </td>
            <td>
                {this.props.item_title}
                <a className="col col-lg-1" style={{float: 'right'}} href={this.props.show_action}>More...</a>
            </td>
        </tr>);
    }
}
