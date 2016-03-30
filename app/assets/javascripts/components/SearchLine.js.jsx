class SearchLine extends React.Component {

    constructor(props){
        super(props);
    }

    handleOnKeyup(e) {
        e.preventDefault();
        searchValue = this.search_text.value.trim();
        this.props.onFormSubmit(searchValue);
    }

    render(){
        return(<form action={this.props.action} method="get">
            <input ref={(ref) => {this.search_text = ref}}
                   placeholder="Start printing something..."
                   type="text"
                   onChange={this.handleOnKeyup.bind(this)}
                   className="form-control"
                   autoComplete="off"/>
        </form>);
    }

}
