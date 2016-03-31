class SearchResults extends React.Component{

    constructor(props){
        super(props);
    }

    renderResults(){
        if (this.props.results.length > 0){
            return(<table className="table table-striped table-bordered table-list">
                <thead>
                    <tr>
                        <th><em className="fa fa-cog"/></th>
                        <th className="hidden-xs">ID</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    {this.renderItems()}
                </tbody>
            </table>);
        }
        else{
            return(<div>
                <br/>
                <div className="col-lg-12">
                    <div className="alert alert-warning">No results were found
                    </div>
                </div>
            </div>);
        }

    }

    renderItems(){
        return(
            this.props.results.map((item) => {
                return(<SearchResultItem edit_action = {this.props.action + '/' + item.id + '/edit'}
                        show_action = {this.props.action + '/' + item.id}
                        item_id = {item.id}
                        item_title = {item.name}/>);
            })
        );
    }

    render() {
        return(<div>{this.renderResults()}</div>);
    }
}